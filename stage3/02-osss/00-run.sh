#!/bin/bash -e

install -v -d "${ROOTFS_DIR}/opt/osss"
install -v -m 600 files/osss-monitor "${ROOTFS_DIR}/opt/osss/"
install -v -m 600 files/config.yaml "${ROOTFS_DIR}/opt/osss/"
install -v -m 600 files/osss-monitor.service "${ROOTFS_DIR}/lib/systemd/system/"

on_chroot << EOF
	SUDO_USER="${FIRST_USER_NAME}" systemctl daemon-reload
	SUDO_USER="${FIRST_USER_NAME}" systemctl enable osss-monitor
EOF