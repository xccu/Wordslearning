using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WordsLearning.Models;

namespace WordsLearning.Controllers
{
    public abstract class ModelController : Controller
    {
        #region Word
        public WordInfo SetWordInfo(Word words)
        {
            return new WordInfo()
            {
                Id = words.WordId,
                spell = words.spell,
                type = words.type,
                speak = HttpUtility.UrlDecode(words.speak, System.Text.Encoding.UTF8),
                translate = words.translate,
                sentence = words.sentence
            };
        }

        public IEnumerable<WordInfo> SetWordInfo(List<Word> words)
        {
            return words.Select(t => new WordInfo()
            {
                Id = t.WordId,
                spell = t.spell,
                type = t.type,
                speak = HttpUtility.UrlDecode(t.speak, System.Text.Encoding.UTF8),
                translate = t.translate,
                sentence = t.sentence
            });
        }

        public Word SetWord(WordInfo wordinfo)
        {
            return new Word()
            {
                WordId = wordinfo.Id,
                spell = wordinfo.spell,
                speak = HttpUtility.UrlEncode(wordinfo.speak, System.Text.Encoding.UTF8),
                type = wordinfo.type,
                translate = wordinfo.translate,
                sentence = wordinfo.sentence
            };
        }
        #endregion

        #region User
        public UserInfo SetUserInfo(User user)
        {
            return new UserInfo()
            {
                Id = user.UserId,
                Name = user.Name,
                Age = user.Age,
                Sex = user.Sex,
                Country = user.Country,
                Imgurl = user.Imgurl,
                Password = user.Password,
                Power = user.Power,
                Status = user.Status
            };
        }

        public IEnumerable<UserInfo> SetUserInfo(List<User> user)
        {
            return user.Select(t => new UserInfo()
            {
                Id = t.UserId,
                Name = t.Name,
                Age = t.Age,
                Sex = t.Sex,
                Country = t.Country,
                Imgurl = t.Imgurl,
                Password = t.Password,
                Power = t.Power,
                Status = t.Status
            });
        }

        public User SetUser(UserInfo userinfo)
        {
            return new User()
            {
                UserId = userinfo.Id,
                Name = userinfo.Name,
                Age = userinfo.Age,
                Sex = userinfo.Sex,
                Country = userinfo.Country,
                Imgurl = userinfo.Imgurl,
                Password = userinfo.Password,
                Power = userinfo.Power,
                Status = userinfo.Status
            };
        }
        #endregion

        #region Reading
        public IEnumerable<ReadingInfo> SetReadingInfo(List<Reading> reading)
        {
            return reading.Select(t => new ReadingInfo()
            {
                Id = t.ReadingId,
                Title = t.Title,
                Content = t.Content,
                Date = t.Date,
                From = t.From,
                Url = t.Url,
            });
        }

        public ReadingInfo SetReadingInfo(Reading reading)
        {
            return new ReadingInfo()
            {
                Id = reading.ReadingId,
                Title = reading.Title,
                Content = reading.Content,
                Date = reading.Date,
                From = reading.From,
                Url = reading.Url,
            };
        }

        public Reading SetReading(ReadingInfo readingInfo)
        {
            return new Reading()
            {
                ReadingId = readingInfo.Id,
                Title = readingInfo.Title,
                Content = readingInfo.Content,
                From = readingInfo.From,
                Url = readingInfo.Url,
                Date = readingInfo.Date,
            };
        }
        #endregion

        #region Music
        public IEnumerable<MusicInfo> SetMusicInfo(List<Music> music)
        {
            return music.Select(t => new MusicInfo()
            {
                Id = t.MusicId,
                Name = t.Name,
                Singer = t.Singer,
                Url = t.Url,
                Lrc = t.Lrc,
                Date = t.Date
            });
        }

        public MusicInfo SetMusicInfo(Music music)
        {
            return new MusicInfo()
            {
                Id = music.MusicId,
                Name = music.Name,
                Singer = music.Singer,
                Url = music.Url,
                Lrc = music.Lrc,
                Date = music.Date
            };
        }

        public Music SetMusic(MusicInfo musicinfo)
        {
            return new Music()
            {
                MusicId = musicinfo.Id,
                Name = musicinfo.Name,
                Singer = musicinfo.Singer,
                Url = musicinfo.Url,
                Lrc = musicinfo.Lrc,
                Date = musicinfo.Date
            };
        }
        #endregion

        public ScoreInfo SetScoreInfo(Score score)
        {
            return new ScoreInfo()
            {
                Id = score.ScoreId,
                UserId = score.UserId,
                CorrectRate = score.CorrectRate,
                SCorrectRate = score.SCorrectRate,
                SpellCount = score.SpellCount,
                FalseSpell = score.FalseSpell,
                FalseTrans = score.FalseTrans,
                TCorrectRate = score.TCorrectRate,
                TransCount = score.TransCount,
            };
        }

        public List<LibraryInfo> SetLibraryInfo(List<Library> library)
        {
            return library.Select(t => new LibraryInfo()
            {
                LibraryId = t.LibraryId,
                LibraryName = t.LibraryName,
            }).ToList();
        }
    }
}
