package vo;

public class CommuteM {
	private int month;
	private int workDay;
	private int goodDay;
	private int lateDay;
	private int earlyDay;
	private int sickDay;
	private int overWork;
	

	@Override
	public String toString() {
		return "CommuteM [month=" + month + ", workDay=" + workDay + ", goodDay=" + goodDay + ", lateDay=" + lateDay
				+ ", earlyDay=" + earlyDay + ", sickDay=" + sickDay + ", overWork=" + overWork + "]";
	}
	
	public CommuteM() {
		super();
	}
	public CommuteM(int month) {
		super();
		this.month = month;
	}
	public CommuteM(int month, int workDay, int goodDay, int lateDay,int earlyDay, int sickDay, int overWork) {
		super();
		this.month = month;
		this.workDay = workDay;
		this.goodDay = goodDay;
		this.lateDay = lateDay;
		this.earlyDay= earlyDay;
		this.sickDay = sickDay;
		this.overWork = overWork;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getWorkDay() {
		return workDay;
	}
	public void setWorkDay(int workDay) {
		this.workDay = workDay;
	}
	public int getGoodDay() {
		return goodDay;
	}
	public void setGoodDay(int goodDay) {
		this.goodDay = goodDay;
	}
	public int getLateDay() {
		return lateDay;
	}
	public void setLateDay(int lateDay) {
		this.lateDay = lateDay;
	}

	public int getEarlyDay() {
		return earlyDay;
	}
	public void setEarlyDay(int earlyDay) {
		this.earlyDay = earlyDay;
	}
	public int getSickDay() {
		return sickDay;
	}
	public void setSickDay(int sickDay) {
		this.sickDay = sickDay;
	}
	public int getOverWork() {
		return overWork;
	}
	public void setOverWork(int overWork) {
		this.overWork = overWork;
	}
		
}
