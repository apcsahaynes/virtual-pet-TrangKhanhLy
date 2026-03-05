public class Game{
    private String name;
    private int happinessIncr;
    private int weightDecr;

    public Game(String name, int happinessIncr, int weightDecr){
        this.name = name;
        this.happinessIncr = happinessIncr;
        this.weightDecr = weightDecr;
    }

    public String getName(){
        return name;
    }

    public int getHappinessIncr(){
        return happinessIncr;
    }

    public int  getWeightLoss(){
        return weightDecr;
    }

    public boolean isWinner(){
        int win = (int) (Math.random() * (100-0+1) + 0);
        if(win <= 50){
            return true;
        } else { 
            return false;
        }
    }
}
