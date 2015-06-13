FROM quay.io/ccll/boot2docker:1.6.2

# Remove the vboxfs automount
RUN rm $ROOTFS/etc/rc.d/automount-shares && \
  WHITELINETOREMOVE=$(( $(sed -n -r '/\/etc\/rc.d\/automount-shares/ =' $ROOTFS/opt/bootscript.sh) + 1)) && \
  sed -i -r $WHITELINETOREMOVE'{/^$/d}' $ROOTFS/opt/bootscript.sh $ROOTFS/opt/bootscript.sh && \
  sed -i -r '/# Automount Shared Folders \(VirtualBox, etc\.\)/d' $ROOTFS/opt/bootscript.sh $ROOTFS/opt/bootscript.sh && \
  sed -i -r '/\/etc\/rc.d\/automount-shares/d' $ROOTFS/opt/bootscript.sh $ROOTFS/opt/bootscript.sh

