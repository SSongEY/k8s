#!/bin/zsh

POD=`kubectl --kubeconfig=$KUBE_CONFIG get pods -n test | grep -v NAME | head -n 1 | awk '{print $1}'`
watch -n 1 "\
    kubectl --kubeconfig=$KUBE_CONFIG describe pod $POD -n test | grep -A10 Events; \
    echo ; \
    kubectl --kubeconfig=$KUBE_CONFIG describe pod $POD -n test | grep Status:; \
    echo ; \
    kubectl --kubeconfig=$KUBE_CONFIG describe pod $POD -n test | grep -A5 Conditions:"

#POD=`kubectl get pods -n test | grep -v NAME | head -n 1 | awk '{print $1}'`
#watch -n 1 "kubectl describe pod $POD -n test | grep -A10 Events; echo ; kubectl describe pod $POD -n test | grep Status:; echo ; kubectl describe pod $POD -n test | grep -A5 Conditions:"
