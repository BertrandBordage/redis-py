cimport cython
from cpython.bool cimport bool
from cpython cimport datetime


cdef list list_or_args(keys, args)

cpdef datetime.datetime timestamp_to_datetime(response)

cdef dict string_keys_to_dict(str key_string, callback)

@cython.locals(result=dict, flags=set)
cdef dict parse_sentinel_state(item)

cdef dict pairs_to_dict(response)

@cython.locals(result=dict)
cdef dict pairs_to_dict_typed(response, dict type_info)

cdef dict SENTINEL_STATE_TYPES


@cython.locals(RESPONSE_CALLBACKS=dict)
cdef class StrictRedis(object):
    cdef public dict response_callbacks
    cdef public connection_pool

    #cpdef set_response_callback(self, command, callback)
    cpdef pipeline(self, bool transaction=*, shard_hint=*)
    cpdef Lock lock(self, name, timeout=*, double sleep=*)
    cpdef PubSub pubsub(self, shard_hint=*)
    #cpdef bgrewriteaof(self)
    #cpdef bgsave(self)
    #cpdef client_kill(self, address)
    #cpdef client_getname(self)
    #cpdef client_setname(self, name)
    #cpdef config_get(self, pattern=*)
    #cpdef config_set(self, name, value)
    #cpdef config_resetstat(self)
    #cpdef dbsize(self)
    #cpdef debug_object(self, key)
    #cpdef echo(self, value)
    #cpdef flushall(self)
    #cpdef flushdb(self)
    #cpdef info(self, section=*)
    cpdef datetime.datetime lastsave(self)
    #cpdef object(self, infotype, key)
    #cpdef ping(self)
    #cpdef save(self)
    #cpdef sentinel_masters(self)
    #cpdef sentinel_slaves(self, service_name)
    #cpdef sentinel_sentinels(self, service_name)
    #cpdef sentinel_get_master_addr_by_name(self, service_name)
    #cpdef shutdown(self)
    #cpdef slaveof(self, host=*, port=*)
    cpdef tuple time(self)
    #cpdef append(self, key, value)
    @cython.locals(params=list)
    cpdef int bitcount(self, key, start=*, end=*)
    cpdef decr(self, name, short int amount=*)
    #cpdef dump(self, name)
    #cpdef exists(self, name)
    #cpdef expire(self, name, time)
    #cpdef expireat(self, name, when)
    #cpdef get(self, name)
    #cpdef getbit(self, name, offset)
    #cpdef getrange(self, key, start, end)
    #cpdef getset(self, name, value)
    cpdef incr(self, name, short int amount=*)
    cpdef incrby(self, name, short int amount=*)
    cpdef incrbyfloat(self, name, double amount=*)
    #cpdef keys(self, pattern=*)
    #cpdef move(self, name, db)
    #cpdef persist(self, name)
    #cpdef pexpire(self, name, time)
    #cpdef pexpireat(self, name, when)
    #cpdef psetex(self, name, time_ms, value)
    #cpdef pttl(self, name)
    #cpdef randomkey(self)
    #cpdef rename(self, src, dst)
    #cpdef renamenx(self, src, dst)
    #cpdef restore(self, name, ttl, value)
    @cython.locals(pieces=list, ms=int)
    cpdef set(self, name, value, ex=*, px=*,
              bool nx=*, bool xx=*)
    #cpdef setbit(self, name, offset, value)
    #cpdef setex(self, name, time, value)
    #cpdef setnx(self, name, value)
    #cpdef setrange(self, name, offset, value)
    #cpdef strlen(self, name)
    cpdef substr(self, name, int start, int end=*)
    #cpdef ttl(self, name)
    #cpdef type(self, name)
    #cpdef unwatch(self)
    #cpdef blpop(self, keys, timeout=*)
    #cpdef brpop(self, keys, timeout=*)
    #cpdef brpoplpush(self, src, dst, timeout=*)
    #cpdef lindex(self, name, index)
    #cpdef linsert(self, name, where, refvalue, value)
    #cpdef llen(self, name)
    #cpdef lpop(self, name)
    #cpdef lpushx(self, name, value)
    cpdef lrange(self, name, int start, int end)
    #cpdef lrem(self, name, int count, value)
    cpdef lset(self, name, int index, value)
    #cpdef ltrim(self, name, start, end)
    #cpdef rpop(self, name)
    #cpdef rpoplpush(self, src, dst)
    #cpdef rpushx(self, name, value)
    @cython.locals(pieces=list, options=dict)
    cpdef sort(self, name, start=*, num=*, by=*, get=*, bool desc=*,
               bool alpha=*, store=*, bool groups=*)
    cpdef bool sismember(self, name, value)
    #cpdef smembers(self, name)
    #cpdef smove(self, src, dst, value)
    #cpdef spop(self, name)
    @cython.locals(args=list)
    cpdef srandmember(self, name, number=*)
    #cpdef zcard(self, name)
    #cpdef zcount(self, name, min, max)
    cpdef zincrby(self, name, value, int amount=*)
    cpdef zinterstore(self, dest, keys, aggregate=*)
    @cython.locals(pieces=list, options=dict)
    cpdef zrange(self, name, int start, int end, bool desc=*,
                 bool withscores=*, score_cast_func=*)
    @cython.locals(pieces=list, options=dict)
    cpdef zrangebyscore(self, name, min, max, start=*, num=*,
                        bool withscores=*, score_cast_func=*)
    cpdef zremrangebyrank(self, name, int min, int max)
    #cpdef zremrangebyscore(self, name, min, max)
    cpdef zrevrange(self, name, int start, int end, bool withscores=*,
                    score_cast_func=*)
    @cython.locals(pieces=list, options=dict)
    cpdef zrevrangebyscore(self, name, max, min, start=*, num=*,
                           bool withscores=*, score_cast_func=*)
    #cpdef zrevrank(self, name, value)
    #cpdef zscore(self, name, value)
    cpdef zunionstore(self, dest, keys, aggregate=*)
    @cython.locals(pieces=list)
    cpdef _zaggregate(self, command, dest, keys, aggregate=*)
    #cpdef hexists(self, name, key)
    #cpdef hget(self, name, key)
    #cpdef hgetall(self, name)
    cpdef hincrby(self, name, key, int amount=*)
    cpdef hincrbyfloat(self, name, key, double amount=*)
    #cpdef hkeys(self, name)
    #cpdef hlen(self, name)
    #cpdef hset(self, name, key, value)
    #cpdef hsetnx(self, name, key, value)
    @cython.locals(items=list)
    cpdef hmset(self, name, dict mapping)
    #cpdef hvals(self, name)
    #cpdef publish(self, channel, message)
    @cython.locals(options=dict)
    cpdef script_flush(self)
    @cython.locals(options=dict)
    cpdef script_kill(self)
    @cython.locals(options=dict)
    cpdef script_load(self, script)
    #cpdef register_script(self, script)


cdef class Redis(StrictRedis):
    pass


cdef class PubSub(object):
    cdef set channels, patterns, subscribe_commands
    cdef int subscription_count
    cdef public connection_pool, shard_hint, connection


#cdef class BasePipeline(object):
#    cdef bool watching, explicit_transaction
#    cdef list command_stack
#    cdef set scripts
#
#    @cython.locals(errors=list, data=list)
#    cpdef _execute_transaction(self, connections, list commands,
#                               bool raise_on_error)


cdef class Script(object):
    pass


@cython.locals(LOCK_FOREVER=double)
cdef class Lock(object):
    cdef public timeout, acquired_until, redis, name
    cdef double sleep

    @cython.locals(unixtime=double, timeout_at=double, existing=double)
    cpdef bool acquire(self, bool blocking=*)
    cpdef release(self)
