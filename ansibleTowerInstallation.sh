#/bin/bash
sed -i "s/^admin_password=''/admin_password=redhat/" /tmp/ansible-tower-setup-*/inventory
sed -i "s/^pg_password=''/pg_password=redhat/" /tmp/ansible-tower-setup-*/inventory
