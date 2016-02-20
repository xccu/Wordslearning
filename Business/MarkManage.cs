using Entites.Repositories;
using Model;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Business
{
    public class MarkManage
    {
        private IMarkRepository _MarkRepository { get; set; }
        private IWordsRepository _WordRepository { get; set; }
        private IWordLibraryRepository _WordLibraryRepository { get; set; }

        public MarkManage()
        {
            _MarkRepository = new MarkRepository(new EFcontext());
            _WordRepository = new WordRepository(new EFcontext());
            _WordLibraryRepository = new WordLibraryRepository(new EFcontext());
        }

        public List<Mark> GetMark(int UserId)
        {
            return _MarkRepository.GetMarked(UserId);
        }

        public List<Word> GetMarkedWords(int UserId,int LibraryId)
        {
            var result = (from t1 in _MarkRepository.Filter(t => t.UserId == UserId&&t.Marked==1).ToList()
                          join t2 in _WordLibraryRepository.Filter(t => t.LibraryId == LibraryId)
                              on t1.WordId equals t2.WordId
                          join t3 in _WordRepository.GetAll()
                              on t1.WordId equals t3.WordId
                          select t3).ToList();
            return result;
        }

        public bool AddMark(int UserId, int WordId)
        {
            Mark mark = new Mark()
            {
                UserId = UserId,
                WordId = WordId,
                Marked = 1,
            };
            try
            {
                _MarkRepository.Add(mark);
                return true;
            }
            catch { return false; }
        }

        public bool UpdateMark(Mark mark)
        {
            try
            {
                _MarkRepository.Update(mark);
                return true;
            }
            catch { return false; }
        }

        public bool DeleteMarkById(int? UserId, int? WordId, out string errorMsg)
        {
            errorMsg = string.Empty;
            try
            {
                Expression<Func<Mark, bool>> whereExpression = null;
                if (UserId != null && WordId == null)
                    whereExpression = t => t.UserId == UserId;
                if (WordId != null && UserId == null)
                    whereExpression = t => t.WordId == WordId;
                if (UserId != null && WordId != null)
                    whereExpression = t => t.UserId == UserId && t.WordId == WordId;
                if (UserId == null && WordId == null)
                {
                    _MarkRepository.Delete();
                    return true;
                }
                var mark = _MarkRepository.Filter(whereExpression).ToList();
                List<int> markId = mark.Select(t => t.MarkId).ToList();
                _MarkRepository.BulkDeleteById(markId);
                return true;
            }
            catch (Exception e)
            {
                errorMsg = e.Message;
                return false;
            }
        }

        public int GetLastMarkPage(int lastId,int LibraryId)
        {
            WordsManage wordsManage = new WordsManage();
            int position = 0;
            var word = wordsManage.GetWords(LibraryId);
            foreach (var item in word)
            {
                position++;
                if (item.WordId == lastId)
                    break;
            }
            int rest = (position % 30 == 0) ? 0 : 1;
            int page = position / 30 + rest;
            return page;
        }

        public bool SetMark(int Marked, int WordId, int UserId)
        {
            var mark = new Mark()
            {
                UserId = UserId,
                WordId = WordId,
                Marked = Marked,
            };
            try
            {
                var oldmark = _MarkRepository.Filter(t => t.UserId == UserId && t.WordId == WordId).FirstOrDefault();
                if (oldmark != null)
                {
                    oldmark.Marked = Marked;
                    UpdateMark(oldmark);
                }
                else
                    AddMark(UserId, WordId);
                return true;
            }
            catch (Exception e) { return false; }
        }
    }
}
