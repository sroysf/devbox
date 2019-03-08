echo "--------------------------------------------"
echo "Generating shared join script"
JOIN_SCRIPT=/vagrant/join-cmd.sh
JOIN_LINE=$(cat kubeinit.log | grep "\-\-token")
rm ${JOIN_SCRIPT}
cat <<EOM >${JOIN_SCRIPT}
#!/bin/bash
${JOIN_LINE}
EOM
