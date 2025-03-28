package Dto;

public class Student {
	private int id;
	private String name;
	private long contact;
	private int physics;
	private int chemistry;
	private int maths;
	public Student(int id, String name, long contact, int physics, int chemistry, int maths) {
		super();
		this.id = id;
		this.name = name;
		this.contact = contact;
		this.physics = physics;
		this.chemistry = chemistry;
		this.maths = maths;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public long getContact() {
		return contact;
	}
	public void setContact(long contact) {
		this.contact = contact;
	}
	public int getPhysics() {
		return physics;
	}
	public void setPhysics(int physics) {
		this.physics = physics;
	}
	public int getChemistry() {
		return chemistry;
	}
	public void setChemistry(int chemistry) {
		this.chemistry = chemistry;
	}
	public int getMaths() {
		return maths;
	}
	public void setMaths(int maths) {
		this.maths = maths;
	}
	
	
	
	
}
