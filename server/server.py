# Module Imports
import mariadb
import sys
import socket
import threading
import time

# Connect to MariaDB Platform
try:
    db = mariadb.connect(
        user="user",
        password="password",
        host="mariadb",
        port=3306,
        database="info801"

    )
except mariadb.Error as e:
    print(f"Error connecting to MariaDB Platform: {e}")
    sys.exit(1)

# Get Cursor
cur = db.cursor()

HEADER = 64
SERVER = socket.gethostbyname(socket.gethostname())
PORT = 5050
ADDR = (SERVER,PORT)
FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "!DISCONNECT"

server = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
server.bind(ADDR)

def getBatimentByName(bat):
    cur.execute(
            "SELECT id FROM batiment WHERE nom=? LIMIT 1", 
            (bat,))
def getPersonneByBadge(badge):
    cur.execute(
        "SELECT id FROM personne WHERE numero_badge=? LIMIT 1", 
                (badge,))

def verify(idBat,idPer):
    cur.execute(
        "SELECT COUNT(*) FROM personne_batiment WHERE batiment_id=? AND personne_id=?", 
                (idBat,idPer))

def insertHistory(personne_id,batiment_id):
    cur.execute(
    "INSERT INTO history (personne_id,batiment_id) VALUES (?, ?)", 
    (personne_id, batiment_id))
    db.commit()
    print(f"Last Inserted ID: {cur.lastrowid}")

def handle_client(conn, addr):
    print(f"[NEW CONNECTION] {addr} connected.")

    connected = True
    while connected:
        msg_length = conn.recv(HEADER).decode(FORMAT)
        if msg_length:
            msg_length = int(msg_length)
            msg = conn.recv(msg_length).decode(FORMAT)
            msg = msg.split(',')
            print(msg)
            if msg == DISCONNECT_MESSAGE:
                connected = False
            if(msg[0] == "batiment"):
                msg.pop(0)
                getBatimentByName(msg[0])
                msg.pop(0)
                (idBat,) = cur.fetchone()
                print(f"id bat: {idBat}")
                #remove scanCarte
                msg.pop(0)
                getPersonneByBadge(msg[0])
                (idPer,) = cur.fetchone()
                print(f"id bat: {idPer}")
                msg.pop(0)
                cur.fetchall()
                verify(idBat,idPer)
                (ver,) = cur.fetchone()
                if ver==0:
                    msg = "status,lumiereRouge"
                    message = msg.encode(FORMAT)
                    msg_length = len(message)
                    send_length = str(msg_length).encode(FORMAT)
                    send_length += b' ' * (HEADER - len(send_length))
                    conn.send(send_length)
                    conn.send(message)
                    insertHistory(idPer,idBat)

                else:
                    msg = "status,lumiereVerte"
                    message = msg.encode(FORMAT)
                    msg_length = len(message)
                    send_length = str(msg_length).encode(FORMAT)
                    send_length += b' ' * (HEADER - len(send_length))
                    conn.send(send_length)
                    conn.send(message)
                    insertHistory(idPer,idBat)
            

    conn.close()
        

def start():
    server.listen()
    print(f"[LISTENING] Server is listening on {SERVER}")
    while True:
        conn, addr = server.accept()
        thread = threading.Thread(target=handle_client, args=(conn, addr))
        thread.start()
        print(f"[ACTIVE CONNECTIONS] {threading.activeCount() - 1}")


print("[STARTING] server is starting...")
start()