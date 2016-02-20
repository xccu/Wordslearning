using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Entity;
using System.Data.Entity.Migrations;
using System.Linq.Expressions;

namespace Repositories
{
    public interface IRepository<TEntity> where TEntity:class
    {
       IQueryable<TEntity> GetAll();

       int GetCount();

       TEntity GetById(int Id);

       TEntity GetFirst();

       TEntity GetLast();

       int Add(TEntity entity);

       int Update(TEntity entity);

       int Delete();

       int Delete(int Id);

       int BulkInsert(IEnumerable<TEntity> entities);

       int BulkDeleteById(IEnumerable<int> IdList);

       int BulkDelete(IEnumerable<TEntity> List);

       IQueryable<TEntity> Filter(Expression<Func<TEntity, bool>> predicate);       
    }
}
