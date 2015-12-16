#include <lws_config.h>
#include <stdio.h>
#include <stdlib.h>
#include <libwebsockets.h>

typedef enum { false, true } bool;

//externalMessageEnqueue(uint8_t * msg, uint8_t msgSize, uint16_t listener_id);



struct Websocket_instance_type {
    uint16_t listener_id;
    //Connector// Pointer to receiver list
struct Msg_Handler ** WS_receiver_list_head;
struct Msg_Handler ** WS_receiver_list_tail;
// Handler Array
struct Msg_Handler * WS_handlers;

};

extern struct Websocket_instance_type Websocket_instance;


struct libwebsocket * Websocket_socket;


struct lws_context_creation_info Websocket_info;
struct libwebsocket_context *Websocket_context;

bool Websocket_is_open;



static int callback_ThingML_protocol(struct libwebsocket_context * this,
                                   struct libwebsocket *wsi,
                                   enum libwebsocket_callback_reasons reason,
                                   void *user, void *in, size_t len)
{
   
    switch (reason) {
        
	case LWS_CALLBACK_CLIENT_ESTABLISHED:
		//printf("[Websocket] LWS_CALLBACK_CLIENT_ESTABLISHED\n");
		/*CONNEXION_ESTABLISHED*/
		break;

	case LWS_CALLBACK_CLOSED:
		//printf("[Websocket] LWS_CALLBACK_CLOSED\n");
		Websocket_is_open = false;
		Websocket_socket = NULL;
		break;

	case LWS_CALLBACK_CLIENT_RECEIVE:{
            int len = strlen((char *) in);
            //printf("[Websocket] l:%i\n", len);
            if ((len % 3) == 0) {
                    unsigned char msg[len % 3];
                    unsigned char * p = in;

                    int buf = 0;
                    int index = 0;
                    bool everythingisfine = true;
                    while ((index < len) && everythingisfine) {
                            if((*p - 48) < 10) {
                                    buf = (*p - 48) + 10 * buf;
                            } else {
                                    everythingisfine = false;
                            }
                            if ((index % 3) == 2) {
                                    if(buf < 256) {
                                            msg[(index-2) / 3] =  (uint8_t) buf;
                                    } else {
                                            everythingisfine = false;
                                    }
                                    buf = 0;
                            }
                            index++;
                            p++;
                    }
                    if(everythingisfine) {
                            int j;
                            externalMessageEnqueue(msg, (len / 3), Websocket_instance.listener_id);
                            //printf("[Websocket] Message received\n");

                    } else {
                            printf("[Websocket] incorrect message '%s'\n", (char *) in);
                    }
            } else {
                printf("[Websocket] incorrect message '%s'\n", (char *) in);
            }
		break;}

	case LWS_CALLBACK_CLIENT_WRITEABLE:{
		//printf("[Websocket] LWS_CALLBACK_CLIENT_WRITEABLE\n");
		Websocket_is_open = true;
		break;}

	default:
		//printf("[Websocket] LWS_CALLBACK default\n");
		break;
    }
   
   
    return 0;
}

static struct libwebsocket_protocols Websocket_protocols[] = {
    {
        "ThingML-protocol", // protocol name - very important!
        callback_ThingML_protocol,   // callback
        0                          // we don't use any per session data
    },
    {
        NULL, NULL, 0   /* End of list */
    }
};

void Websocket_set_listener_id(uint16_t id) {
	Websocket_instance.listener_id = id;
}

void Websocket_setup() {
	Websocket_is_open = false;


    
    
	Websocket_info.port = CONTEXT_PORT_NO_LISTEN;
	Websocket_info.protocols = Websocket_protocols;
	Websocket_info.extensions = libwebsocket_get_internal_extensions();
	Websocket_info.gid = -1;
	Websocket_info.uid = -1;


	// create libwebsocket Websocket_context representing this server
    Websocket_context = libwebsocket_create_context(&Websocket_info);
   
    if (Websocket_context == NULL) {
        fprintf(stderr, "[Websocket] libwebsocket init failed\n");
        return -1;
    }

    printf("[Websocket] Init WS Client on port:%i\n", 9000);
}

void Websocket_start_receiver_process() {
	
    printf("[Websocket] Start running WS Client\n");
	
	int n = 0;
	int ret = 0;
	int port = 9000;
	int use_ssl = 0;
	int ietf_version = -1; /* latest */

	Websocket_socket = libwebsocket_client_connect(Websocket_context, "192.168.1.108", port, use_ssl,
			"/", "192.168.1.108", "192.168.1.108",
			 Websocket_protocols[0].name, ietf_version);

	if (Websocket_socket == NULL) {
		fprintf(stderr, "libwebsocket connect failed\n");
		ret = 1;
	}

	fprintf(stderr, "Waiting for connect...\n");
    printf("[Websocket] Starting server...\n");
	
    // infinite loop, to end this server send SIGTERM. (CTRL+C)
    while (1) {
        libwebsocket_service(Websocket_context, 50);
    }
	
    libwebsocket_context_destroy(Websocket_context);
}

void Websocket_forwardMessage(char * msg, int length) {
	if(Websocket_is_open) {
		int n, m, i;
		unsigned char buf[LWS_SEND_BUFFER_PRE_PADDING + (length * 3 + 1) +
							  LWS_SEND_BUFFER_POST_PADDING];
		unsigned char *p = &buf[LWS_SEND_BUFFER_PRE_PADDING];	
		unsigned char *q = p;
		n = 0;
		for(i = 0; i < length; i++) {
			//printf("%03i -> ", (unsigned char) msg[i]);
			n += sprintf((unsigned char *)q, "%03i", (unsigned char) msg[i]);
			//printf("%s\n", q);
			n--;
			q += 3;
		}
		*q = '\0';
		n++;
		//printf("[Websocket] Trying to send:\n%s \n", p);

		m = libwebsocket_write(Websocket_socket, p, (length * 3 + 1), LWS_WRITE_TEXT);
	} else {
		//printf("[Websocket] Error: Attempting to write on a closed socket\n");
	}
}


