// Generated code, any edits will be eventually lost.
package com.funnyhatsoftware.spacedock.data;

import java.util.ArrayList;
import java.util.Map;

public class FlagshipBase extends SetItem {
    String ability;
    public String getAbility() { return ability; }
    public FlagshipBase setAbility(String v) { ability = v; return this;}
    int agility;
    public int getAgility() { return agility; }
    public FlagshipBase setAgility(int v) { agility = v; return this;}
    int attack;
    public int getAttack() { return attack; }
    public FlagshipBase setAttack(int v) { attack = v; return this;}
    int battleStations;
    public int getBattleStations() { return battleStations; }
    public FlagshipBase setBattleStations(int v) { battleStations = v; return this;}
    int cloak;
    public int getCloak() { return cloak; }
    public FlagshipBase setCloak(int v) { cloak = v; return this;}
    int cost;
    public int getCost() { return cost; }
    public FlagshipBase setCost(int v) { cost = v; return this;}
    int crew;
    public int getCrew() { return crew; }
    public FlagshipBase setCrew(int v) { crew = v; return this;}
    int evasiveManeuvers;
    public int getEvasiveManeuvers() { return evasiveManeuvers; }
    public FlagshipBase setEvasiveManeuvers(int v) { evasiveManeuvers = v; return this;}
    String externalId;
    public String getExternalId() { return externalId; }
    public FlagshipBase setExternalId(String v) { externalId = v; return this;}
    String faction;
    public String getFaction() { return faction; }
    public FlagshipBase setFaction(String v) { faction = v; return this;}
    int hull;
    public int getHull() { return hull; }
    public FlagshipBase setHull(int v) { hull = v; return this;}
    int scan;
    public int getScan() { return scan; }
    public FlagshipBase setScan(int v) { scan = v; return this;}
    int sensorEcho;
    public int getSensorEcho() { return sensorEcho; }
    public FlagshipBase setSensorEcho(int v) { sensorEcho = v; return this;}
    int shield;
    public int getShield() { return shield; }
    public FlagshipBase setShield(int v) { shield = v; return this;}
    int talent;
    public int getTalent() { return talent; }
    public FlagshipBase setTalent(int v) { talent = v; return this;}
    int targetLock;
    public int getTargetLock() { return targetLock; }
    public FlagshipBase setTargetLock(int v) { targetLock = v; return this;}
    int tech;
    public int getTech() { return tech; }
    public FlagshipBase setTech(int v) { tech = v; return this;}
    String title;
    public String getTitle() { return title; }
    public FlagshipBase setTitle(String v) { title = v; return this;}
    int weapon;
    public int getWeapon() { return weapon; }
    public FlagshipBase setWeapon(int v) { weapon = v; return this;}
    ArrayList<EquippedShip> ships = new ArrayList<EquippedShip>();
    @SuppressWarnings("unchecked")
    public ArrayList<EquippedShip> getShips() { return (ArrayList<EquippedShip>)ships.clone(); }
    @SuppressWarnings("unchecked")
    public FlagshipBase setShips(ArrayList<EquippedShip> v) { ships = (ArrayList<EquippedShip>)v.clone(); return this;}

    public void update(Map<String,Object> data) {
        ability = DataUtils.stringValue((String)data.get("Ability"));
        agility = DataUtils.intValue((String)data.get("Agility"));
        attack = DataUtils.intValue((String)data.get("Attack"));
        battleStations = DataUtils.intValue((String)data.get("Battlestations"));
        cloak = DataUtils.intValue((String)data.get("Cloak"));
        cost = DataUtils.intValue((String)data.get("Cost"));
        crew = DataUtils.intValue((String)data.get("Crew"));
        evasiveManeuvers = DataUtils.intValue((String)data.get("EvasiveManeuvers"));
        externalId = DataUtils.stringValue((String)data.get("Id"));
        faction = DataUtils.stringValue((String)data.get("Faction"));
        hull = DataUtils.intValue((String)data.get("Hull"));
        scan = DataUtils.intValue((String)data.get("Scan"));
        sensorEcho = DataUtils.intValue((String)data.get("SensorEcho"));
        shield = DataUtils.intValue((String)data.get("Shield"));
        talent = DataUtils.intValue((String)data.get("Talent"));
        targetLock = DataUtils.intValue((String)data.get("TargetLock"));
        tech = DataUtils.intValue((String)data.get("Tech"));
        title = DataUtils.stringValue((String)data.get("Title"));
        weapon = DataUtils.intValue((String)data.get("Weapon"));
    }

}
