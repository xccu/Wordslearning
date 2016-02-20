using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entites.Repositories;
using Model;
using Repositories;

namespace Business
{
    public class ScoreManage
    {
        private ITestedRepository _TestedRepository { get; set; }
        private IScoreRepository _ScoreRepository { get; set; }       

        public ScoreManage()
        {
            _TestedRepository = new TestedRepository(new EFcontext());
            _ScoreRepository = new ScoreRepository(new EFcontext());           
        }

        public void CreatScoreReport(int UserId)
        {
            var score = new Score() 
            {
                UserId=UserId,
            };
            _ScoreRepository.Add(score);
        }

        public void SetScore(int count, int falsecount, int UserId,List<int> WordId, int Test)
        {
            var score = GetScore(UserId);
            SetTestedWords(Test, UserId, WordId);

            if (Test == 0)
            {
                score.SpellCount += count;
                score.FalseSpell += falsecount;
                if (score.SpellCount > 0)
                    score.SCorrectRate = (float)(score.SpellCount - score.FalseSpell) / (float)(score.SpellCount);
            }
            if (Test == 1)
            {
                score.TransCount += count;
                score.FalseTrans += falsecount;
                if (score.TransCount > 0)
                    score.TCorrectRate = (float)(score.TransCount - score.FalseTrans) / (float)(score.TransCount);
            }
            var aa = (float)(score.TransCount + score.SpellCount - score.FalseTrans - score.FalseSpell) / (float)(score.TransCount + score.SpellCount);
            score.CorrectRate = (float)(score.TransCount + score.SpellCount - score.FalseTrans - score.FalseSpell) / (float)(score.TransCount + score.SpellCount);
            _ScoreRepository.Update(score);
        }

        public Score GetScore(int UserId)
        {
            return _ScoreRepository.Filter(t => t.UserId == UserId).FirstOrDefault();
        }

        public bool CleanScoreReport(int UserId)
        {
            string errorMsg = string.Empty;
            TestedManage testedManage = new TestedManage();
            try
            {
                testedManage.DeleteTestedById(UserId, null, out errorMsg);

                var score = GetScore(UserId);
                score.SCorrectRate = 0;
                score.SpellCount = 0;
                score.TCorrectRate = 0;
                score.TransCount = 0;
                score.FalseTrans = 0;
                score.FalseSpell = 0;
                score.CorrectRate = 0;
                _ScoreRepository.Update(score);
                return true;
            }
            catch(Exception e) 
            {
                errorMsg = e.Message;
                return false;
            }
        }

        public bool DeleteScoreReportByUserId(int UserId,out string errorMsg)
        {
            errorMsg = string.Empty;
            try
            {
                _ScoreRepository.DeleteReportByUserId(UserId);
                return true;
            }
            catch (Exception e)
            {
                errorMsg = e.Message;
                return false;
            }
        }

        private void SetTestedWords(int tag, int UserId, List<int> WordId)
        {
            var tested = new Tested();
            //tag: 0 for spell; 1 for translate
            foreach (var item in WordId)
            {
                tested.tag = tag;
                tested.UserId = UserId;
                tested.WordId = item;
                _TestedRepository.Add(tested);
            }
        }
    }
}