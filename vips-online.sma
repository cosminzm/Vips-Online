#include <amxmodx>
// #include <amxmisc>
// #include <cstrike>
// #include <engine>
// #include <fakemeta>
// #include <hamsandwich>
// #include <fun>
// #include <xs>
// #include <sqlx>

#define PLUGIN  "vip online"
#define VERSION "1.0"
#define AUTHOR  "COSMIN"

new maxplayers, gmsgSayText;

public plugin_init()
{
	register_plugin(PLUGIN, VERSION, AUTHOR)

	register_clcmd("say", "handle_say");
    register_clcmd("say_team", "handle_say");

    maxplayers = get_maxplayers();
    gmsgSayText = get_user_msgid("SayText"); 
	
	
}

// ->>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>> [ VIPS ONLINE GAMELIFE . RO ] <<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<< //
						public handle_say(id) {
						    new said[192]
						    read_args(said,192)
						    if( ( contain(said, "/vips") != -1 ))
						        set_task(0.1,"vipsonline",id)
						    return PLUGIN_CONTINUE
						}

						public vipsonline(user) 
						{
						    new adminnames[33][32]
						    new message[256]
						    new id, count, x, len
						    
						    for(id = 1 ; id <= maxplayers ; id++)
						        if(is_user_connected(id))
						            if(get_user_flags(id) & ADMIN_LEVEL_H)
						                get_user_name(id, adminnames[count++], 31)

						    len = format(message, 255, "%s GameLife.Ro VIP GOLD ONLINE: ","^x04")
						    if(count > 0) {
						        for(x = 0 ; x < count ; x++) {
						            len += format(message[len], 255-len, "%s%s ", adminnames[x], x < (count-1) ? ", ":"")
						            if(len > 96 ) {
						                print_message(user, message)
						                len = format(message, 255, "%s ","^x04")
						            }
						        }
						        print_message(user, message)
						    }
						    else {
						        len += format(message[len], 255-len, "GameLife.ro No VIP GOLD ONLINE")
						        print_message(user, message)
						    }
						}
						print_message(id, msg[]) {
						    message_begin(MSG_ONE, gmsgSayText, {0,0,0}, id)
						    write_byte(id)
						    write_string(msg)
						    message_end()
						}