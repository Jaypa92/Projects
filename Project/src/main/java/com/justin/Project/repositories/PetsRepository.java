package com.justin.Project.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.justin.Project.models.Pets;

public interface PetsRepository extends CrudRepository<Pets, Long>{
	List<Pets> findAll();
}
