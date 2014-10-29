# /etc/profile

# System wide environment and startup programs, for login setup
# Functions and aliases go in /etc/bashrc

# It's NOT a good idea to change this file unless you know what you
# are doing. It's much better to create a custom.sh shell script in
# /etc/profile.d/ to make custom changes to your environment, as this
# will prevent the need for merging in future updates.

pathmunge () {
    case ":${PATH}:" in
        *:"$1":*)
            ;;
        *)
            if [ "$2" = "after" ] ; then
                PATH=$PATH:$1
            else
                PATH=$1:$PATH
            fi
    esac
}


if [ -x /usr/bin/id ]; then
    if [ -z "$EUID" ]; then
        # ksh workaround
        EUID=`id -u`
        UID=`id -ru`
    fi
    USER="`id -un`"
    LOGNAME=$USER
    MAIL="/var/spool/mail/$USER"
fi

# Path manipulation
if [ "$EUID" = "0" ]; then
    pathmunge /sbin
    pathmunge /usr/sbin
    pathmunge /usr/local/sbin
else
    pathmunge /usr/local/sbin after
    pathmunge /usr/sbin after
    pathmunge /sbin after
fi

HOSTNAME=`/bin/hostname 2>/dev/null`
HISTSIZE=1000
if [ "$HISTCONTROL" = "ignorespace" ] ; then
    export HISTCONTROL=ignoreboth
else
    export HISTCONTROL=ignoredups
fi

export PATH USER LOGNAME MAIL HOSTNAME HISTSIZE HISTCONTROL

# By default, we want umask to get set. This sets it for login shell
# Current threshold for system reserved uid/gids is 200
# You could check uidgid reservation validity in
# /usr/share/doc/setup-*/uidgid file
if [ $UID -gt 199 ] && [ "`id -gn`" = "`id -un`" ]; then
    umask 002
else
    umask 022
fi

for i in /etc/profile.d/*.sh ; do
    if [ -r "$i" ]; then
        if [ "${-#*i}" != "$-" ]; then
            . "$i"
        else
            . "$i" >/dev/null 2>&1
        fi
    fi
done

unset i
unset -f pathmunge


export JAVA_HOME=/opt/cscloud/jdk1.8.0_20/
export JRE_HOME=/opt/cscloud/jdk1.8.0_20/jre
export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

export JAVA_HOME=/opt/cscloud/jdk1.8.0_20/
export JRE_HOME=/opt/cscloud/jdk1.8.0_20/jre
export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

export HADOOP_HOME=/opt/cscloud/hadoop-2.5.1
export PATH=$PATH:$HADOOP_HOME:$HADOOP_HOME/bin
export HADOOP_HOME_WARN_SUPPRESS=1

export SPARK_HOME=/opt/cscloud/spark-1.1.0/
export PATH=$PATH:$SPARK_HOME:$SPARK_HOME/bin

export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$HADOOP_HOME:$HADOOP_HOME/bin
export HADOOP_HOME_WARN_SUPPRESS=1

export CLASSPATH=$CLASSPATH:$HADOOP_HOME/etc/hadoop
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/common/lib/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/common/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/hdfs/lib/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/hdfs/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/mapreduce/lib/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/mapreduce/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done

export JAVA_HOME=/opt/cscloud/jdk1.8.0_20/
export JRE_HOME=/opt/cscloud/jdk1.8.0_20/jre
export CLASSPATH=$JAVA_HOME/lib:$JRE_HOME/lib
export PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin

export HADOOP_HOME=/opt/cscloud/hadoop-2.5.1
export PATH=$PATH:$HADOOP_HOME:$HADOOP_HOME/bin
export HADOOP_HOME_WARN_SUPPRESS=1

export SPARK_HOME=/opt/cscloud/spark-1.1.0/
export PATH=$PATH:$SPARK_HOME:$SPARK_HOME/bin

export HADOOP_MAPRED_HOME=$HADOOP_HOME
export HADOOP_COMMON_HOME=$HADOOP_HOME
export HADOOP_HDFS_HOME=$HADOOP_HOME
export HADOOP_YARN_HOME=$HADOOP_HOME
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH=$PATH:$HADOOP_HOME:$HADOOP_HOME/bin
export HADOOP_HOME_WARN_SUPPRESS=1

export CLASSPATH=$CLASSPATH:$HADOOP_HOME/etc/hadoop
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/common/lib/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/common/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/hdfs/lib/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/hdfs/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/mapreduce/lib/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done
for file in `ls /opt/cscloud/hadoop-2.5.1/share/hadoop/mapreduce/*.jar`
do
  export CLASSPATH=$CLASSPATH:$file
done

