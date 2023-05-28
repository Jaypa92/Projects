package com.justin.Project.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justin.Project.models.Pets;
import com.justin.Project.repositories.PetsRepository;

@Service
public class PetsService {
	@Autowired
	PetsRepository petsRepo;;
	
	public List<Pets> findAll(){
		return petsRepo.findAll();
	}
	
	public Pets create(Pets pets) {
		return petsRepo.save(pets);
	}
	
	public Pets findById(Long id) {
		Optional<Pets> pet = petsRepo.findById(id);
		if(pet.isPresent()) {
			return pet.get();		}
		return null;
	}
	
	public Pets update(Pets pets) {
		Optional<Pets> pet = petsRepo.findById(pets.getId());
		if(pet.isPresent()) {
			return petsRepo.save(pets);		}
		return null;
	}
	
	public void delete(Long id) {
		petsRepo.deleteById(id);
	}
}
