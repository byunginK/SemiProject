package dto;

import java.io.Serializable;

public class CartDto implements Serializable {

	private int seq;
	private String id;
	private int item_seq;
	private int qty;
	
	public CartDto() {
	}

	public CartDto(int seq, String id, int item_seq, int qty) {
		super();
		this.seq = seq;
		this.id = id;
		this.item_seq = item_seq;
		this.qty = qty;
	}
	
	
	
	public CartDto(String id, int item_seq, int qty) {
		super();
		this.id = id;
		this.item_seq = item_seq;
		this.qty = qty;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getItem_seq() {
		return item_seq;
	}

	public void setItem_seq(int item_seq) {
		this.item_seq = item_seq;
	}

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	@Override
	public String toString() {
		return "CartDto [seq=" + seq + ", id=" + id + ", item_seq=" + item_seq + ", qty=" + qty + "]";
	}
	
	
}
