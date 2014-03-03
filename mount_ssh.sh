
# Mount, via nfs, the remote folder specified in the first parameter
# in the local folder, specified in the second parameter.
# The script will get the ssh host to use in the mount command.
# This is specially helpful when the remote ip/domain, changes constantly.


function mountssh {
    remote_path=$1; #path to be mounted
    local_path=$2; #local path
    sship=${SSH_CONNECTION%% *};
    mounthost=$(host $sship | sed 's/.*pointer //' | sed 's/\.$//');

    #echo 'DEBUG  ==========================';
    #echo 'Local Path:';
    #echo ${local_path};
    #echo 'Remote Path:'
    #echo ${remote_path};
    #echo 'Client IP:'
    #echo ${sship};
    #echo '==========================';

    cd;

    sudo umount -f ${local_path} > /tmp/mountssh.log 2>&1
    sudo mount -t nfs -o nolock ${sship}:${remote_path} ${local_path}
    
    cd ${local_path};
}


# Usage sample:
# mountssh /Path/in/the/remote/machine /Path/in/the/local/machine

