--// French language translations by DrumSlayer
-- Letters prefixed with a '%' (ex: %s, %i) are substituted for variables during run time, don't break those
-- '\n' and '\r\n' are used to create a new line, try to keep those in similar spots to preserve spacing

local l = gPhone.createLanguage( "french" )

-- General
l.title = "Le Telephone Garry"
l.slide_unlock = "Glisse pour deverouiller"
l.update_check_fail = "Impossible de se connecter au site gPhone, Verifiez votre version et postez un commentaire sur le WorkShop!"
l.kick = "[gPhone]: REQUETE ILLEGALE - ERREUR: 0x01B4D0%s"
l.feature_deny = "Cette fonction n'a pas encore été implantée"
l.error = "Erreur"

l.default = "Defaut"
l.language = "Language"
l.settings = "Parametres"
l.general = "General"
l.wallpaper = "Fond D'écran"
l.homescreen = "Menu Principal"
l.about = "A propos"
l.color = "Couleur"

l.phone_confis = "Votre téléphone a été confisqué!"
l.unable_to_open = "Il est impossible d'ouvrir votre gPhone pour le moment"

-- Homescreen
l.battery_dead = "Votre téléphone n'a plus de batterie et elle est morte! Rechargement..."
l.battery_okay = "Rechargée!"
l.service_provider = "Garry"
l.folder_fallback = "Dossier"
l.invalid_folder_name = "Invalide"

-- Tutorial
l.tut_welcome = "Bienvenue dans gPhone! Voici un bref tutoriel des fonctions!"
l.tut_folders = "Utilisez le menu principal pour creer des dossiers et bouger les applications, comme un iPhone!"
l.tut_delete = "Restez appuyer sur le clic gauche pour faire apparaitre le menu de gestion de l'application"
l.tut_text = "Parlez a vos amis dans le jeu grace a la messagerie! Cliquez sur le coté droit pour supprimer"
l.tut_wallpaper = "Change your home and lock screen wallpapers using pictures from your computer"
l.tut_music = "Stream music from the internet or off your computer with the music app!"
l.tut_translate = "Want to help translate? Add me on Steam and you could be in the phone's credits!"
l.tut_coders = "Coders: Check the wiki on Github and the example app included to help you make apps"
l.tut_end = "That only scratches the surface of the phone's features. Have fun!!"

-- App base
l.app_error = "[Erreur D'application]"
l.app_deny_gm = "Cette application ne peut etre lancée sur ce mode de jeu!"
l.app_deny_group = "Vous n'êtes pas dans le bon rang pour ouvrir cette application!"

-- Requests
l.confirmation = "Confirmation"
l.confirm = "Confirmer"
l.request = "Demande"
l.deny = "Refuser"
l.accept = "Accepter"
l.no = "Non"
l.yes = "Oui"
l.okay = "Okay"
l.response_timeout = "%s na pas repondu a votre requete a temps"

l.accept_fallback = "%s has accepted your request to use %s"
l.phone_accept = "%s has accepted your call"
l.gpong_accept = "%s has accepted your request to play gPong"

l.deny_fallback = "%s has denied your request to use %s"
l.phone_deny = "%s has denied your call"
l.gpong_deny = "%s has denied your request to play gPong"

-- Data transfer
l.transfer_fail_gm = "You cannot wire money in gamemodes that are not DarkRP"
l.transfer_fail_cool = "You must wait %i's before you can transfer more money"
l.transfer_fail_ply = "Unable to complete transaction - invalid recipient"
l.transfer_fail_amount = "Unable to complete transaction - nil amount"
l.transfer_fail_generic = "Unable to complete transaction, sorry"
l.transfer_fail_funs = "Unable to complete transaction - lack of funds" 

l.received_money = "Received $%i from %s!"
l.sent_money = "Wired $%i to %s successfully!"

l.text_cooldown = "You cannot text for %i more seconds!"
l.text_flagged = "To prevent spam, you have been blocked from texting for %i seconds!"

l.being_called = "%s is calling you!"

-- Settings
l.wallpapers = "Wallpapers"
l.airplane_mode = "Airplane Mode"
l.vibrate = "Vibrate"
l.stop_on_tab = "Stop music on tab"
l.find_album_covers = "Find album covers"
l.show_unusable_apps = "Show unusable apps"
l.reset_app_pos = "Reset icon positions"
l.archive_cleanup = "Archive cleanup"
l.file_life = "File life (days)"
l.wipe_archive = "Wipe archive"

l.choose_new_wp = "Choose new wallpaper"
l.wp_selector = "Wallpaper selector"
l.dark_status = "Darken status bar"
l.set_lock = "Set lockscreen"
l.set_home = "Set homescreen"
l.reset_homescreen = "Are you sure you want to reset the homescreen icon positions?"
l.lang_reboot_warn = "The gPhone will reboot when the language is changed and confirmed"

l.no_description = "No description provided"
l.install_u = "Install Update"
l.wipe_archive_confirm = "Are you sure you want to delete all files in the archive? (this cannot be undone)"
l.archive = "Archive"
l.update = "Update"
l.noupdate = "Your phone is up-to-date"
l.set_color = "Set Color"

l.wipe_log_confirm = "Are you sure you want to wipe the log? This cannot be undone"
l.developer = "Developer"
l.wipe_log = "Wipe log"
l.dump_log = "Dump to file"
l.c_print = "Console Printing"

l.binds = "Binds"
l.open_key = "Open key"
l.key_hold = "Key hold time"

-- Contacts
l.contacts = "Contacts"
l.search = "Search"
l.back = "Back"
l.number = "Number"

-- Phone
l.phone = "Phone"
l.mute = "Mute"
l.unmute = "Unmute"
l.keypad = "Keypad"
l.speaker = "Speaker"
l.add = "Add"
l.end_call = "End call"
l.cannot_call = "%s cannot be called at this moment! Sorry"
l.hung_up_on = "Your call has been ended by the person you were calling"
l.invalid_player_phone = "That is not a valid number to call!"

-- Pong
l.gpong = "gPong"
l.playerbot = "Player v Bot"
l.playerplayer = "Player v Player"
l.playerself = "Player v Self"
l.easy = "Easy"
l.medium = "Intermediate"
l.hard = "Hard"

l.challenge_ply = "Challenge Player!"
l.gpong_self_instructions = " Player 1:\r\n W and S\r\n Player 2:\r\n Up and Down arrow keys" 
l.start = "Start!"
l.resume = "Resume"
l.quit = "Quit"
l.p1_win = "P1 wins!"
l.p2_win = "P2 wins!"

-- Text/Messages
l.messages = "Messages"
l.delete = "Delete"
l.last_year = "Last year"
l.yesterday = "Yesterday"
l.years_ago = "years ago"
l.days_ago = "days ago"
l.send = "Send"
l.new_msg = "New message"
l.to = "To:"
l.invalid_player_warn = "That is not a valid player or number to send a message to"
l.message_len_warn = "That text message is too long to be sent!"

-- Store
l.no_homescreen_space = "You do not have enough homescreen space to add a new app!"
l.app_store = "App Store"
l.no_apps = "No apps"
l.no_apps_phrase = "There are no apps available, sorry :("
l.get = "Get"
l.have = "Have"

-- Music
l.music = "Music"
l.music_format_warn = "That is not a valid music url! The file extension should be .mp3 or .wav"
l.editor = "Editor"
l.editor_help = "* Only the song URL is required"
l.artist_name = "Artist Name"
l.song_name = "Song Name"
l.song_url = "Song Url"
l.album_url = "Album Url" 

-- Finances
l.finances = "Finances"
l.transfer = "Transfer"
l.current_user = "Current User: %s"
l.balance = "Balance: $%s"
l.salary = "Salary: $%s"
l.wire_money = "Wire Funds"
l.wire_invalid_player = "Invalid target to wire money to!"
l.wire_invalid_amount = "Invalid amount of money to wire!"
l.wire_no_money = "You do not have enough money to send!"
l.receiver = "Receiver"

-- Flappy Garry
l.enter_play = "Press 'enter' to play!"

-- Browser
l.connecting = "Connecting"
