# Module Imports
import socket

HEADER = 64
SERVER = "server"
PORT = 5050
FORMAT = 'utf-8'
DISCONNECT_MESSAGE = "!DISCONNECT"
ADDR = (SERVER,PORT)
NAME = "polytech"


client = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
client.connect(ADDR)

def send(msg):
    message = msg.encode(FORMAT)
    msg_length = len(message)
    send_length = str(msg_length).encode(FORMAT)
    send_length += b' ' * (HEADER - len(send_length))
    client.send(send_length)
    client.send(message)
    msg_length = int(client.recv(HEADER))
    msg = client.recv(msg_length).decode(FORMAT)
    return msg
connected = True
while connected:
    msg = "batiment,"
    msg += NAME + ","
    print(" MENU \n")
    print("1 : Scannez votre carte \n")
    print("0 : Quittez\n")
    rentre = input()
    if rentre == "1":
        msg += "scanCarte,"
        print("Votre numero de carte:\n")
        rentre = input()
        msg += rentre
        res = send(msg).split(',')
        print(res)
        res.pop(0)
        print(f"Lumiere :{res[0]}")
    if rentre == "0":
        connected = False
        send(DISCONNECT_MESSAGE)