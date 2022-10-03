# Xkbcomp usage manual & some examples
Xkbcomp is a tool for setting the xkb keyboard layout. Here is my notes on how to use xkbcomp, which is my intepretation from the [guide on Arch Wiki](https://wiki.archlinux.org/title/X_keyboard_extension). Please skim through this guide before proceding to the main content.

## 1. General
- To read the current config to an ```output.xkb``` file, use the following command:
    ```
    xkbcomp $DISPLAY output.xkb
    ```
    And to write config in an ```input.xkb``` into the server, run:
    ```
    xkbcomp input.xkb $DISPLAY
    ```
- To make the change permanent, save it as ```~/.Xkeymap``` and make ```~/.xinitrc``` load it on startup:
    ```
    ~/.xinitrc
    -----------------
    test -f ~/.Xkeymap && xkbcomp ~/.Xkeymap $DISPLAY
    ```
- Each key has 3 references:
    + *Keycode*: defined in ***```xkb_keycodes```***. <br>
        **```<CAPS>```** ```= 66;``` 
    + *Action*: defined in ***```xkb_symbols```***. Determines which key does what.  <br> 
        ```key <CAPS> {[   ```**```Caps_Lock```**```] };```
    + *Modifier* (if that key is a modifier): defined at the end of ***```xkb_symbols```***, if that key is a modifier. <br>
        ```modifier_map``` **```Lock```** ```{<CAPS>};``` <br>
    The action then can be mapped with the modifier in the ***```xkb_compatibility```***: <br>
        ```interpret``` **```Caps_Lock```**```+AnyOfOrNone(all) {action= LockMods(modifiers=```**```Lock```**```);}```<br>
    The whole example is visualized as follow:<br>
    ```
                        (keycode) 
                          CAPS
        xkb_symbols ______/  \______  xkb_symbols
                   /                \
                  /    xkb_compat    \
            Caps_lock  --------->   Lock
            (action)             (modifier)


        CAPS     ---->     Caps_lock    ---->        Lock
    (keycode)  xkb_symbols  (action)   xkb_compat  (modifier)
    ```

## 2. Examples
Here are a few examples on how I edit my xkbcomp:
### 2.1. CapsLock to Control
- Schema for CapsLock will be like this:
    - *Keycode*:  ```<CAPS>```
    - *Action*: ```Control_L```
    - *Modifier*: ```Control``` 
- Match the CAPS keycode with Control_L action and Control modifier in ***```xkb_symbols```***:
    ```
    xkb_symbols "pc+us+inet(evdev)" {
        ...
        // key <CAPS> {[ Caps_Lock ]}    
        key <CAPS> {[ Control_L ]}    // CAPS to Control_L action
        ...
        // modifier_map Lock { <CAPS> };
        modifier_map Control { <CAPS> }; // CAPS to Control modifier
    };
    ```
- In order to still use CapsLock, you can map RAlt + CapsLock to Caps_Lock:
    ```
    xkb_symbols "pc+us+inet(evdev)" {
        ...
        key <CAPS> {         [       Control_L,     Control_L,    Caps_Lock ] };
        ...
    };
    ```
- or map LeftControl to Caps_Lock:
     ```
    xkb_symbols "pc+us+inet(evdev)" {
        ...
        key <LCTL> {[ Caps_Lock ]}    
        ...
        modifier_map Lock { <LCTL> };
    };
    ```
   
### 2.2. Map right alt to Mod5 and use P, F, N, B for arrows
- Schema for right alt will be like this:
    - *Keycode*:  ```<RALT>```
    - *Action*: ```Alt_R```
    - *Modifier*: change from ```Alt``` to ```Mod5```
- Firstly, map the keycode RALT to Mod5 modifier in ```xkb_symbols```:
    ```
    xkb_symbols "pc+us+inet(evdev)" {
        ...
        // modifier_map Mod1 { <RALT> };
        modifier_map Mod5 { <RALT> };
    };
    ```
- Secondly, change modifier for R_Alt from Alt to Mod5 in ```xkb_compatibility```:
    ```
    xkb_compatibility "complete" {
        ...
        interpret Alt_R+AnyOf(all) {
            action= SetMods(modifiers=Mod5);
        };
        ...
        interpret Alt_R+AnyOfOrNone(all) {
            action= SetMods(modifiers=Mod5);
        };
    };
    ```
- Next, create a new customed type for the arrow keys (Mod5 + P, F, B, N) to use in ```xkb_types```:
    ```
    xkb_types "complete" {
        ...
        type "CUST_LEVEL3" {
        modifiers= Shift+Mod5; 
        map[Shift] = Level2;
        map[Mod5] = Level3;
        map[Shift+Mod5] = Level3;
        level_name[Level1]= "Base";
        level_name[Level2]= "Shift";
        level_name[Level3]= "Mod5";
        };
    };
   ```
- Finally, create the third level as arrow keys for P, F, B, N in ```xkb_symbols``` as following:
    ```
    xkb_symbols "pc+us+inet(evdev)" {
        ...
        key <AD10> {
            type= "CUST_LEVEL3",
            symbols[Group1]= [               p,               P,               Up],
            actions[Group1]= [      NoAction(),      NoAction(),   RedirectKey(keycode=<UP>, clearmods=Mod5) ]
        };
        ...
    };
    ```
    Note: the keycode for right arrow key is RGHT
### 2.3. PrtSc to Super_R
- My ThinkPad has PrtSc between right alt and right control, so I want to turn that into right super. The schema will be like this:
    - *Keycode*:  ```<PRSC>```
    - *Action*: ```Super_R```
    - *Modifier*: ```Mod4``` 
- Similar to the CapsLock example, all we need to do is matching the CAPS keycode with Super_R action and Mod4 modifier in ***```xkb_symbols```***:
    ```
    xkb_symbols "pc+us+inet(evdev)" {
        ...
        key <PRSC> {
            type= "PC_ALT_LEVEL2",
            symbols[Group1]= [           Super_R,         Sys_Req ]
        };
        ...
        modifier_map Mod4 { <PRSC> };
    };
    ```
    Then, if you want to take screenshot, just use shortcuts with Super_R instead of Print.
### 2.4. RightShift to Up/Down
- Another way to use Up/Down without reaching to the arrow keys is to map RightShift to Down, and RightAlt + RightShift to Up.
- First, comment out the RightShift as a mod at the end of `xkb_symbols`, then modify the key.
    ```
    xkb_symbols "pc+us+inet(evdev)" {
        ...
        key <RTSH> {         
            type= "CUST_LEVEL3",
            symbols[Group1]= [            Down,            Down,            Up],
            actions[Group1]= [       NoAction(),     NoAction() ,  RedirectKey(keycode=<UP>, clearmods=Mod5) ]
        };
        ...
        // modifier_map Shift { <RTSH> };
        ...
        };
    ```
## References
1. [Guide for xkb on Arch Wiki](https://wiki.archlinux.org/title/X_keyboard_extension)
2. [Xkb notes](https://www.charvolant.org/doug/xkb/html/node5.html#SECTION00052000000000000000)