package com.realnet.btrst1.Controllers;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
 import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.fasterxml.jackson.core.JsonProcessingException;
import org.springframework.web.bind.annotation.CrossOrigin;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.realnet.config.EmailService;
import com.realnet.users.entity1.AppUser;
import com.realnet.users.service1.AppUserServiceImpl;import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.*;
import com.realnet.btrst1.Entity.Gtesr;
import com.realnet.btrst1.Services.GtesrService ;
@RequestMapping(value = "/Gtesr")
 @CrossOrigin("*") 
@RestController
public class GtesrController {
	@Autowired
	private GtesrService Service;

@Value("${projectPath}")
	private String projectPath;

	public final String UPLOAD_DIREC = "/Files"; 
	@PostMapping("/Gtesr")
		  public Gtesr Savedata(@RequestBody Gtesr data) {
		Gtesr save = Service.Savedata(data)	;
			System.out.println(save);
	 return save;
	  }
@PutMapping("/Gtesr/{id}")
	public  Gtesr update(@RequestBody Gtesr data,@PathVariable Integer id ) {
		Gtesr update = Service.update(data,id);
		return update;
	}	 
	
	@GetMapping("/Gtesr")
	public List<Gtesr> getdetails() {
		 List<Gtesr> get = Service.getdetails();		
		return get;
}
@GetMapping("/Gtesr/{id}")
	public  Gtesr  getdetailsbyId(@PathVariable Integer id ) {
		Gtesr  get = Service.getdetailsbyId(id);
		return get;
	}
@DeleteMapping("/Gtesr/{id}")
	public  void delete_by_id(@PathVariable Integer id ) {
	Service.delete_by_id(id);
		
	}

}