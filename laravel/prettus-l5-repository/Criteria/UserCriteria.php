<?php

namespace App\Criteria;

use Prettus\Repository\Contracts\CriteriaInterface;
use Prettus\Repository\Contracts\RepositoryInterface;

/**
 * Class UserJobseekerCriteria.
 *
 * @package namespace App\Criteria;
 */
class UserCriteria implements CriteriaInterface
{
    private $userType;

    public function setType(int $type)
    {
        $this->userType = $type;
    }

    public function apply($model, RepositoryInterface $repository)
    {
        if ($this->userType){
            $model = $model->where('user_type_id', '=', $this->userType);
        }
        return $model;
    }
}
