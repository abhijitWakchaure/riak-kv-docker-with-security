log.console = file
log.console.level = info
log.console.file = $(platform_log_dir)/console.log
log.error.file = $(platform_log_dir)/error.log
log.syslog = off
log.crash = on
log.crash.file = $(platform_log_dir)/crash.log
log.crash.maximum_message_size = 64KB
log.crash.size = 10MB
log.crash.rotation = $D0
log.crash.rotation.keep = 5

nodename = riak@127.0.0.1

distributed_cookie = riak
erlang.async_threads = 64
erlang.max_ports = 262144
dtrace = off
platform_bin_dir = /usr/sbin
platform_data_dir = /var/lib/riak
platform_etc_dir = /etc/riak
platform_lib_dir = /usr/lib/riak/lib
platform_log_dir = /var/log/riak
anti_entropy = active
storage_backend = bitcask
object.format = 1
object.size.warning_threshold = 5MB
object.size.maximum = 50MB

object.siblings.warning_threshold = 25
object.siblings.maximum = 100
bitcask.data_root = $(platform_data_dir)/bitcask
bitcask.io_mode = erlang
riak_control = on
riak_control.auth.mode = userlist
riak_control.auth.user.tom.password = tom
leveldb.maximum_memory.percent = 70
leveldb.compression = on
leveldb.compression.algorithm = lz4
search = off
search.solr.start_timeout = 30s
search.solr.port = 8093
search.solr.jmx_port = 8985
search.solr.jvm_options = -d64 -Xms1g -Xmx1g -XX:+UseStringCache -XX:+UseCompressedOops
distributed_cookie = riakkv