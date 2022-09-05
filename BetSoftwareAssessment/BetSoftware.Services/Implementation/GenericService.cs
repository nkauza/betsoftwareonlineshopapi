using BetSoftware.Repository.Interface;
using BetSoftware.Services.Interface;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace BetSoftware.Services.Implementation
{
    public abstract class GenericService<T>: IGenericService<T> where T: class, new()
    {
        protected IGenericRepository<T> Repository { get; }

        public GenericService(IGenericRepository<T> repository)
        {
            Repository = repository;
        }

        public void Insert(T entity)
        {
            Repository.Insert(entity);
        }

        public async Task<IEnumerable<T>> GetAll()
        {
            return await Repository.GetAll();
        }

        public async Task<T> GetById(object id)
        {
            return await Repository.GetById(id);
        }

        public void Update(T entity)
        {
            Repository.Update(entity);
        }

        public void Delete(object id)
        {
            Repository.Delete(id);
        }

        public async Task<int> Save()
        {
            return await Repository.Save();
        }
    }
}
