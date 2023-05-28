package com.justin.Project.models;

import java.util.Comparator;

public class TypeComparator implements Comparator<Pets> {
	public int compare(Pets p1, Pets p2) {
		return p1.getType().compareTo(p2.getType());
	}
}
