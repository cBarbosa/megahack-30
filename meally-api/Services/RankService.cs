using meally_api.Command;
using meally_api.Data.Interfaces;
using meally_api.Domain;
using meally_api.Services.Interfaces;
using System;

namespace meally_api.Services
{
    public class RankService : IRankService
    {
        public readonly IRankDAO repository;

        public RankService(IRankDAO _repository)
        {
            repository = _repository;
        }

        public Rank GetByRestaurantId(int id)
        {
            return repository.GetByRestaurantId(id);
        }

        public Rank Insert(RankCommand rank)
        {
            var _rank = BindRank(rank);

            return repository.Insert(_rank);
        }

        private Rank BindRank(RankCommand rank)
        {
            return new Rank
            {
                Code = rank.Code,
                Rating = rank.Rating,
                RestaurantId = rank.RestaurantId
            };
        }
    }
}