package com.justin.Project.models;

import java.util.Comparator;

public class BreedComparator implements Comparator<Pets>{
	public int compare(Pets p1, Pets p2) {
		return p1.getBreed().compareTo(p2.getBreed());
	}
}
