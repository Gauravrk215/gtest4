package com.realnet.btrst1.Services;
import com.realnet.btrst1.Repository.GtesrRepository;
import com.realnet.btrst1.Entity.Gtesr;import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;

@Service
 public class GtesrService {
@Autowired
private GtesrRepository Repository;
public Gtesr Savedata(Gtesr data) {
				return Repository.save(data);	
			}

			
public List<Gtesr> getdetails() {
				return (List<Gtesr>) Repository.findAll();
			}


public Gtesr getdetailsbyId(Integer id) {
	return Repository.findById(id).get();
			}


	public void delete_by_id(Integer id) {
 Repository.deleteById(id);
}


public Gtesr update(Gtesr data,Integer id) {
	Gtesr old = Repository.findById(id).get();
old.setCollge(data.getCollge());
old.setName(data.getName());
final Gtesr test = Repository.save(old);
  return test;}}
