from .connection cimport ConnectionPool


cdef class SentinelConnectionPool(ConnectionPool):
    cdef public is_master, check_connection, master_address
    cdef service_name, sentinel_manager, slave_rr_counter

#cdef class Sentinel(object):
#    pass
