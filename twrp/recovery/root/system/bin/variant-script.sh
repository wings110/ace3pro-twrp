#!/system/bin/sh
# This script is needed to automatically set device props.

variant=$(getprop ro.boot.prjname)
#region=$(getprop ro.boot.product.hardware.sku)

echo $variant
#echo $region

#case $region in
#    "21")
    #China
        case $variant in
            "23814")
            #China?
                resetprop ro.product.device "OP5D06L1"
                resetprop ro.product.vendor.device "OP5D06L1"
                resetprop ro.product.odm.device "OP5D06L1"
                resetprop ro.product.product.device "OP5D06L1"
                resetprop ro.product.device "OP5D06L1"
                resetprop ro.product.system_ext.device "OP5D06L1"
                resetprop ro.product.product.model "PJX110"
                resetprop ro.product.model "OP5D06L1"
                resetprop ro.product.system.model "OP5D06L1"
                resetprop ro.product.system_ext.model "OP5D06L1"
                resetprop ro.product.vendor.model "OP5D06L1"
                resetprop ro.product.odm.model "OP5D06L1"
                resetprop ro.boot.hardware.revision "CN"
                ;;
#            "22861")
#           #India
#                resetprop ro.product.device "OP594DL1"
#                resetprop ro.product.odm.device "OP594DL1"
#                resetprop ro.product.product.device "OP594DL1"
#                resetprop ro.product.system_ext.device "OP594DL1"
#                resetprop ro.product.vendor.device "OP594DL1"
#                resetprop ro.product.product.model "CPH2447"
#                resetprop ro.product.product.model "CPH2447"
#                resetprop ro.product.model "CPH2447"
#                resetprop ro.product.system.model "CPH2447"
#                resetprop ro.product.system_ext.model "CPH2447"
#                resetprop ro.product.vendor.model "CPH2447"
#                resetprop ro.product.odm.model "CPH2447"
#                resetprop ro.boot.hardware.revision "IN"
#                ;;
            *)
                resetprop ro.product.device "OP5D06L1"
                resetprop ro.product.vendor.device "OP5D06L1"
                resetprop ro.product.odm.device "OP5D06L1"
                resetprop ro.product.product.device "OP5D06L1"
                resetprop ro.product.device "OP5D06L1"
                resetprop ro.product.system_ext.device "OP5D06L1"
                resetprop ro.product.product.model "PJX110"
                resetprop ro.product.model "PJX110"
                resetprop ro.product.system.model "PJX110"
                resetprop ro.product.system_ext.model "PJX110"
                resetprop ro.product.vendor.model "PJX110"
                resetprop ro.product.odm.model "PJX110"
                resetprop ro.boot.hardware.revision "CN"
                ;;
        esac
        ;;
#    "22")
#    #Europe
#            resetprop ro.product.device "OP594DL1"
#            resetprop ro.product.odm.device "OP594DL1"
#            resetprop ro.product.product.device "OP594DL1"
#            resetprop ro.product.device "OP594DL1"
#            resetprop ro.product.system_ext.device "OP594DL1"
#            resetprop ro.product.vendor.device "OP594DL1"
#            resetprop ro.product.product.model "CPH2449"
#            resetprop ro.boot.hardware.revision "EU"
#        ;;
#    "23")
#    #NA
#            resetprop ro.product.device "OP594DL1"
#            resetprop ro.product.odm.device "OP594DL1"
#            resetprop ro.product.product.device "OP594DL1"
#            resetprop ro.product.system_ext.device "OP594DL1"
#            resetprop ro.product.vendor.device "OP594DL1"
#            resetprop ro.product.product.model "CPH2451"
#            resetprop ro.product.model "CPH2451"
#            resetprop ro.product.system.model "CPH2451"
#            resetprop ro.product.system_ext.model "CPH2451"
#            resetprop ro.product.vendor.model "CPH2451"
#            resetprop ro.product.odm.model "CPH2451"
#            resetprop ro.boot.hardware.revision "NA"
#        ;;
#    *)
#            resetprop ro.product.device "OP594DL1"
#            resetprop ro.product.odm.device "OP594DL1"
#            resetprop ro.product.product.device "OP594DL1"
#            resetprop ro.product.system_ext.device "OP594DL1"
#            resetprop ro.product.vendor.device "OP594DL1"
#            resetprop ro.product.product.model "CPH2449"
#            resetprop ro.boot.hardware.revision "EU"
#        ;;
#esac

exit 0