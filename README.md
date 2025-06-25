# 🎖️ VIP Online Plugin for AMXX (CS 1.6)

This AMXX plugin displays a list of **online VIPs** (users with `ADMIN_LEVEL_H` flag) when a player types `/vips` in the chat. It is a simple and efficient way to highlight premium players or special members on your server.

---

## 🧩 Plugin Info

- **Name:** VIP Online
- **Version:** 1.0
- **Author:** COSMIN
- **Game:** Counter-Strike 1.6
- **AMXX Version Required:** AMX Mod X 1.8.2 or higher

---

## 💬 Features

- Players can type `/vips` in chat to see a list of VIPs currently online.
- Displays names directly in chat with color formatting.
- Detects connected players with the `ADMIN_LEVEL_H` flag (commonly used for VIP access).

---

## 📥 Installation

1. **Download / Compile Plugin:**
   - Compile `vip_online.sma` using the [AMXX compiler](https://www.amxmodx.org/compiler.php) or locally.

2. **Move Files:**
   - Place the compiled `.amxx` file in:
     ```
     cstrike/addons/amxmodx/plugins
     ```

3. **Enable Plugin:**
   - Add the plugin name to your `plugins.ini`:
     ```
     vip_online.amxx
     ```

4. **Assign VIP Flag:**
   - In `users.ini`, assign the `t` flag (`ADMIN_LEVEL_H`) to VIP players. Example:
     ```
     "PlayerName" "password" "abcdefghijklmnopqrstu" "a"
     ```

---

## 🗨️ Usage

- In-game, players can type:
/vips

yaml
Copiar
Editar
and a list of online VIPs will be shown in the chat.

---

## 📌 Notes

- The plugin uses the `SayText` message to print colored chat messages.
- Messages are automatically split if they exceed the display limit.
- If no VIPs are online, a message is shown accordingly.

---

## 🛠️ Customization

- **Flag:** You can change the required VIP flag (`ADMIN_LEVEL_H`) by modifying the following line in the code:
```cpp
if(get_user_flags(id) & ADMIN_LEVEL_H)
