
DEFAULT="client_template.conf"
FILEEXTENSION=".ovpn"
CRT=".crt"
KEY=".key"
CA="ca.crt"
TA="ta.key"
KEYDIR="./"

echo "enter actual name (leave blank if no existing user): "
read NAME

echo "enter output filename:"
read OVPNOUTFILENAME

if [ ! -f "$KEYDIR$NAME$CRT" ]; then
   echo "[ERROR]: Client Public Key Certificate was not found: $KEYDIR$NAME$CRT"
   exit 1
fi
echo "Client's cert found: $KEYDIR$NAME$CRT"

if [ ! -f "$KEYDIR$NAME$KEY" ]; then
   echo "[ERROR]: Client 3des Private Key was not found: $KEYDIR$NAME$KEY"
   exit 1
fi
echo "Client's Private Key was not found: $KEYDIR$NAME$KEY"

if [ ! -f "$KEYDIR$CA" ]; then
   echo "[ERROR]: CA Public Key was not found: $KEYDIR$CA"
   exit 1
fi
echo "CA public Key was not found: $KEYDIR$CA"

if [ ! -f "$KEYDIR$TA" ]; then
   echo "[ERROR]: tls-auth Key was not found: $KEYDIR$TA"
   exit 1
fi
echo "tls-auth Private Key was found: $KEYDIR$TA"

cat "$DEFAULT" > "$OVPNOUTFILENAME$FILEEXTENSION"

echo "<ca>" >> "$OVPNOUTFILENAME$FILEEXTENSION"
cat "$KEYDIR$CA" | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >> "$OVPNOUTFILENAME$FILEEXTENSION"
echo "</ca>" >> "$OVPNOUTFILENAME$FILEEXTENSION"

echo "<cert>" >> "$OVPNOUTFILENAME$FILEEXTENSION"
cat "$KEYDIR$NAME$CRT" | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' >> "$OVPNOUTFILENAME$FILEEXTENSION"
echo "</cert>" >> "$OVPNOUTFILENAME$FILEEXTENSION"

echo "<key>" >> "$OVPNOUTFILENAME$FILEEXTENSION"
cat "$KEYDIR$NAME$KEY" >> "$OVPNOUTFILENAME$FILEEXTENSION"
echo "</key>" >> "$OVPNOUTFILENAME$FILEEXTENSION"

echo "<tls-auth>" >> "$OVPNOUTFILENAME$FILEEXTENSION"
cat "$KEYDIR$TA" >> "$OVPNOUTFILENAME$FILEEXTENSION"
echo "</tls-auth>" >> "$OVPNOUTFILENAME$FILEEXTENSION"

echo "File $OVPNOUTFILENAME$FILEEXTENSION was created ok..."
