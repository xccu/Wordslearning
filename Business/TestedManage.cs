using Entites.Repositories;
using Model;
using Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Web;

namespace Business
{
    public class TestedManage
    {
        private IWordsRepository _WordRepository { get; set; }
        private ITestedRepository _TestedRepository { get; set; }
        private IWordLibraryRepository _WordLibraryRepository { get; set; }

        public TestedManage()
        {
            _WordRepository = new WordRepository(new EFcontext());
            _TestedRepository = new TestedRepository(new EFcontext());
            _WordLibraryRepository = new WordLibraryRepository(new EFcontext());
        }

        #region tested
        public List<Word> PrepareTest(string falseid, User user, int LibraryId, int tag, out int finished, out int rate)
        {
            WordsManage wordsManage = new WordsManage();
            var falselist = falseid.Split('/');
            var idlist = new List<int>();
            var words = new List<Word>();

            finished = (from t1 in _WordRepository.GetAll().ToList()
                        join t2 in _WordLibraryRepository.Filter(t => t.LibraryId == LibraryId)
                        on t1.WordId equals t2.WordId
                        join t3 in _TestedRepository.Filter(t => t.tag == tag && t.UserId == user.UserId)
                        on t2.WordId equals t3.WordId
                        select t1.WordId).ToList().Count();

            rate = (int)(((float)finished / (float)wordsManage.GetWords(LibraryId).Count()) * 100);

            if (string.IsNullOrEmpty(falseid))
                words = wordsManage.GetTenWords(tag, user.UserId, LibraryId);
            else
            {
                for (int i = 0; i < falselist.Length - 1; i++)
                {
                    var word = new Word();
                    word = wordsManage.GetWordById(int.Parse(falselist[i]));
                    word.speak = HttpUtility.UrlDecode(word.speak, System.Text.Encoding.UTF8);
                    words.Add(word);
                }
            }
            return words;
        }

        public bool DeleteTestedById(int? UserId, int? WordId, out string errorMsg)
        {
            errorMsg = string.Empty;
            try
            {

                Expression<Func<Tested, bool>> whereExpression = null;
                if (UserId != null && WordId == null)
                    whereExpression = t => t.UserId == UserId;
                if (WordId != null && UserId == null)
                    whereExpression = t => t.WordId == WordId;
                if (UserId != null && WordId != null)
                    whereExpression = t => t.UserId == UserId && t.WordId == WordId;
                if (UserId == null && WordId == null)
                {
                    _TestedRepository.Delete();
                    return true;
                }
                var tested = _TestedRepository.Filter(whereExpression).ToList();
                List<int> testedId = tested.Select(t => t.TestedId).ToList();
                _TestedRepository.BulkDeleteById(testedId);
                return true;

            }
            catch (Exception e)
            {
                errorMsg = e.Message;
                return false;
            }
        }
        #endregion
    }
}
