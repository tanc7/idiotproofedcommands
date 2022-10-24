# For some stupid reason, Proxmox does not properly document how to move/clone storage between nodes of a Proxmox Cluster with differently named storage pools, and it's been going on for YEARS.
qm migrate 101 vhost3 --targetstorage disk3 --with-local-disks
