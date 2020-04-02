<?php


namespace App\Services;

use App\Criteria\UserCriteria;
use App\Repositories\User\UserRepositoryEloquent;

class UserService extends BaseService
{
    public function __construct(UserRepositoryEloquent $repo)
    {
        $this->repo = $repo;
    }

    public function getAll(){
        $criteria = new UserCriteria();
        $result =$this->repo->pushCriteria($criteria);
        return $result;
    }
}
