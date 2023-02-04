    state("The Multi-Medium")
{
	int currentScene : "UnityPlayer.dll", 0x017E7810, 0x8, 0x8, 0x28, 0x8, 0x10, 0x28, 0x40;
	int currentWorld : "UnityPlayer.dll", 0x017E7810, 0x8, 0x8, 0x28, 0x8, 0x10, 0x28, 0x38;
}	

isLoading 
{
    return current.currentScene == 12;
}

split
{
	return old.currentScene != current.currentScene && current.currentScene != 0 && old.currentScene != 0 && old.currentScene != 12 && old.currentScene != 10 || old.currentScene == 12 && current.currentScene == 13;
}

update
{
    print ("current scene is" + current.currentScene);
}

start
{
    return current.currentScene == 1 && old.currentScene == 12 && current.currentScene != 0 || current.currentScene != 12 && old.currentScene == 12 && current.currentScene != 0 && settings["il_timing"]; 
}

init
{
    refreshRate = 120;
}

reset 
{
    return current.currentWorld == 0;
}

startup
{
    settings.Add ("il_timing", false, "IL Timing (start the timer on every level)");
}
