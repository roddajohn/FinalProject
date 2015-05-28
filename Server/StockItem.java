public class StockItem extends Stock {
    private int amount;

    public StockItem(String s, int amt) {
	symbol = s;
	amount = amt;
    }

    public void addAmount(int i) {
	amount += i;
    }

    public int getAmount(int i) {
	return amount;
    }
}