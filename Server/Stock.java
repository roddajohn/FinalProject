public class Stock {
    private String name, symbol;
    private double currentValue, closeLastDay, openLastDay;

    public Stock(String s) {
	symbol = s;
    }

    public void setCurrentValue(double d) {
	currentValue = d;
    }

    public void setCloseLastDay(double d) {
	closeLastDay = d;
    }

    public void setOpenLastDay(double d) {
	openLastDay = d;
    }

    public void setName(String s) {
	name = s;
    }

    public void setSymbol(String s) {
	symbol = s;
    }

    public String getSymbol() {
	return symbol;
    }

    public String getName() {
	return name;
    }

    public double getCurrentValue() {
	return currentValue;
    }

    public double getCloseLastDay() {
	return closeLastDay;
    }

    public double getOpenLastDay() {
	return openLastDay;
    }

    public String toString() {
	String toReturn = "";
	toReturn += name + " Current Price: " + currentValue;
	return toReturn;
    }
}