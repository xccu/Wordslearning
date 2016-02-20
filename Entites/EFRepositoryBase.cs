using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Repositories;
using Model;
using System.Data.Entity;
using System.Data;
using System.Linq.Expressions;


namespace Entites
{
    public abstract class EFRepositoryBase<T> :IRepository<T> where T:class
    {
        protected EFcontext EF = new EFcontext();

        public EFRepositoryBase(EFcontext DataCotent)
        {
            EF = DataCotent;
        }

        public virtual IQueryable<T> GetAll()
        {
            return EF.Set<T>();
        }

        public int GetCount()
        {
            return EF.Set<T>().Count();
        }

        public T GetById(int Id)
        {
            return EF.Set<T>().Find(Id);
        }

        public T GetFirst()
        {
            return EF.Set<T>().ToList().FirstOrDefault();
        }

        public T GetLast()
        {
            return EF.Set<T>().ToList().LastOrDefault();
        }

        public int Add(T entity)
        {
            EF.Set<T>().Add(entity);
            return EF.SaveChanges();
        }

        public int Update(T entity)
        {
            EF.Entry(entity).State = EntityState.Modified;
            return EF.SaveChanges();
        }

        public int Delete()
        {
            var entity = EF.Set<T>().ToList();
            foreach(var item in entity)
                EF.Set<T>().Remove(item);
            return EF.SaveChanges();
        }

        public int Delete(int Id)
        {
            var entity = EF.Set<T>().Find(Id);
            EF.Set<T>().Remove(entity);
            return EF.SaveChanges();
        }

        public int BulkInsert(IEnumerable<T> entities)
        {
            EF.Configuration.AutoDetectChangesEnabled = false;
            foreach (var item in entities)
                EF.Set<T>().Add(item); 
            return EF.SaveChanges();
        }

        public int BulkDeleteById(IEnumerable<int> IdList)
        {
            EF.Configuration.AutoDetectChangesEnabled = false;
            foreach (var Id in IdList)
            {
                var entity = EF.Set<T>().Find(Id);
                EF.Set<T>().Remove(entity);
            }
            return EF.SaveChanges();
        }

        public int BulkDelete(IEnumerable<T> List)
        {
            EF.Configuration.AutoDetectChangesEnabled = false;
            foreach (var item in List)
            {
                var entity = EF.Set<T>().Find(item);
                EF.Set<T>().Remove(entity);
            }
            return EF.SaveChanges();
        }

        public virtual IQueryable<T> Filter(Expression<Func<T, bool>> predicate)
        {
            return EF.Set<T>().Where<T>(predicate).AsQueryable<T>();
        }
    }
}
