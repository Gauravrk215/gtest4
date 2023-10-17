package com.realnet.btrst1.Repository;


import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.stereotype.Repository;
 

import com.realnet.btrst1.Entity.Gtesr;

@Repository
public interface  GtesrRepository  extends  JpaRepository<Gtesr, Integer>  { 
}