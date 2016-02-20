using Entites.Repositories;
using Model;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Business
{
    public class LibraryManage:BaseManage
    {
        
        private IWordsRepository _WordRepository { get; set; }
        private ILibraryRepository _LibraryRepository { get; set; }
        private IWordLibraryRepository _WordLibraryRepository { get; set; }

        public LibraryManage()
        {
            _WordRepository = new WordRepository(new EFcontext());
            _LibraryRepository = new LibraryRepository(new EFcontext());
            _WordLibraryRepository = new WordLibraryRepository(new EFcontext());
        }

        public bool UpdateLibrary(int WordId,List<int> LibraryIds)
        {
            var librarylist=_WordLibraryRepository.Filter(t=>t.WordId==WordId).Select(t=>t.LibraryId).ToList();

            foreach (var item in librarylist)
            {
                if (!LibraryIds.Contains(item))
                {
                    var WordLibraryId = (from t1 in _WordRepository.Filter(t => t.WordId == WordId).ToList()
                                       join t2 in _WordLibraryRepository.Filter(t => t.LibraryId == item).ToList()
                                           on t1.WordId equals t2.WordId
                                       select t2.WordLibraryId).FirstOrDefault();
                    _WordLibraryRepository.Delete(WordLibraryId);                 
                }
                RemoveCache("GetWords(" + item + ")");
            }

            foreach (var item in LibraryIds)
            {
                if (!librarylist.Contains(item))
                    _WordLibraryRepository.Add(new WordLibrary() { WordId = WordId, LibraryId = item });                 
                RemoveCache("GetWords(" + item + ")");
            }
            return true;
        }

        public List<Library> GetLibrary()
        {
            return _LibraryRepository.GetAll().ToList();
        }

        public string GetLibraryName(int LibraryId)
        {
           var Library= _LibraryRepository.Filter(t => t.LibraryId == LibraryId).FirstOrDefault();
           return Library.LibraryName;
        }

        public bool AddWordLibrary(int WordId,List<int> LibraryId)
        {
            try
            {
                foreach (var item in LibraryId)
                {
                    WordLibrary WordLibrary = new WordLibrary() { WordId = WordId, LibraryId = item };
                    _WordLibraryRepository.Add(WordLibrary);
                    RemoveCache("GetWords(" + item + ")");
                }
                return true;
            }
            catch (Exception e) { return false; }
        }

        public string GetLibraryStrByWordId(int WordId)
        {            
            string LibraryStr = string.Empty;
            try
            {
                var list = _WordLibraryRepository.Filter(t => t.WordId == WordId).ToList();
                foreach (var item in list)
                {
                    LibraryStr += item.LibraryId + "_";
                }
                return LibraryStr;
            }
            catch (Exception e) { return LibraryStr; }
        }

        public bool DeleteLibrary(int WordId,out string errorMsg)
        {
            errorMsg = string.Empty;
            try
            {
                var Idlist = _WordLibraryRepository.Filter(t => t.WordId == WordId).ToList();
                foreach (var item in Idlist)
                {                   
                    _WordLibraryRepository.Delete(item.WordLibraryId);
                    RemoveCache("GetWords(" + item.LibraryId + ")");
                }
                return true;
            }
            catch (Exception e) 
            {
                errorMsg = e.Message;
                return false; 
            }
        }
    }
}
