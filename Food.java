public class Food{
    private String name;
    private int energyIncrease;
    private int happinessIncrease;
    private int weightGain;

    public Food(String name, int energyIncrease, int happinessIncrease, int weightGain){
        this.name = name;
        this.energyIncrease = energyIncrease;
        this.happinessIncrease = happinessIncrease;
        this.weightGain = weightGain;
    }

    public String getName(){
        return name;
    }

    public int getEnergyRating(){
        return energyIncrease;
    }

    public int getHappinessRating(){
        return happinessIncrease;
    }

    public int getWeightGain(){
        return weightGain;
    }
}
