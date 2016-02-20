using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entites.Repositories;
using Model;
using System.Linq.Expressions;
using System.IO;
using System.Xml.Serialization;
using System.Web;
using Repositories;

namespace Business
{
    public class MediaManage:BaseManage
    {

        private IMusicRepository _MusicRepository { get; set; }
        private IReadingRepository _ReadingRepository { get; set; }

        public MediaManage()
        {
            _MusicRepository = new MusicRepository(new EFcontext());
            _ReadingRepository = new ReadingRepository(new EFcontext());
        }

        public List<Music> GetMusics()
        {
            var result = GetCache("GetAllMusics") as List<Music>;
            if (result != null)
                return result;
            result = _MusicRepository.GetAll().ToList();
            SetCache("GetAllMusics", result); // add in Cache
            return result;
        }

        public int GetMusicCount()
        {
            return _MusicRepository.GetCount();
        }

        public Music GetMusicById(int Id)
        {
            return _MusicRepository.Filter(t => t.MusicId == Id).FirstOrDefault();
        }

        public bool AddMusic(Music music)
        {
            try
            {
                _MusicRepository.Add(music);
                RemoveCache("GetAllMusics");
                return true;
            }
            catch(Exception e) 
            {
                return false;
            }
        }

        public bool UpdateMusic(Music music)
        {
            try
            {
                if (string.IsNullOrEmpty(music.Url))
                    _MusicRepository.updateWithoutUrl(music);
                else
                    _MusicRepository.Update(music);
                RemoveCache("GetAllMusics");
                return true;
            }
            catch(Exception e)
            {
                return false;
            }
        }

        public bool DeleteMusic(int Id)
        {
            try
            {
                _MusicRepository.Delete(Id);
                RemoveCache("GetAllMusics");
                return true;
            }
            catch(Exception e)
            {
                return false;
            }
        }

        public List<Reading> GetReadings()
        {
            var result = GetCache("GetAllMusics") as List<Reading>;
            if (result != null)
                return result;
            result = _ReadingRepository.GetAll().OrderByDescending(t => t.Date).ToList();
            SetCache("GetAllMusics", result);
            return result;
        }

        public int GetReadingCount()
        {
            return _ReadingRepository.GetCount();
        }

        public Reading GetReadingById(int Id)
        {
            return _ReadingRepository.Filter(t=>t.ReadingId==Id).FirstOrDefault();
        }        

        public bool AddReading(Reading reading)
        {
            try
            {
                _ReadingRepository.Add(reading);
                RemoveCache("GetAllMusics");
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool UpdateReadig(Reading reading)
        {
            try
            {
                if (string.IsNullOrEmpty(reading.Url))
                    _ReadingRepository.updateReadingWithoutUrl(reading);
                else
                    _ReadingRepository.Update(reading);
                RemoveCache("GetAllMusics");
                return true;
            }
            catch
            {
                return false;
            }
        }

        public bool DeleteReading(int Id)
        {
            try
            {
                _ReadingRepository.Delete(Id);
                RemoveCache("GetAllMusics");
                return true;
            }
            catch(Exception e)
            {
                return false;
            }
        }

        public List<Music> SearchMusic(string search)
        {
            return _MusicRepository.Filter(t => t.Name.Contains(search) || t.Singer.Contains(search)).OrderBy(t => t.Name).ToList();
        }

        public List<Reading> SearchReading(string search)
        {
            return _ReadingRepository.Filter(t => t.Title.Contains(search) || t.From.Contains(search)).OrderBy(t => t.Title).ToList();
        }
    }
}
