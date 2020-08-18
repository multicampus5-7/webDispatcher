package db;

public class Sales {
	private String name;
	private int amount;
	private int price;

	public Sales() {
	}
	
	public Sales(String name, int amount) {
		this.name = name;
		this.amount = amount;
	}

	public Sales(String name, int amount, int price) {
		this.name = name;
		this.amount = amount;
		this.price = price;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "Sales [name=" + name + ", amount=" + amount + ", price=" + price + "]";
	}
	
	
}
