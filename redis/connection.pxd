cimport cython


@cython.locals(MAX_READ_LENGTH=int, EXCEPTION_CLASSES=dict)
cdef class PythonParser(object):
    cdef _fp, encoding

    @cython.locals(bytes_left=int, read_len=int)
    cpdef str read(self, length=*)

    @cython.locals(error_code=str)
    cpdef parse_error(self, str response)

    @cython.locals(length=int, byte=str)
    cpdef read_response(self)


cdef class Connection(object):
    cdef public:
        short int pid, port, db
        decode_responses, _sock, _parser, encoding
    cdef host, password, socket_timeout, encoding_errors


cdef class UnixDomainSocketConnection(Connection):
    cdef path


cdef class ConnectionPool(object):
    cdef public:
        short int pid
        long int max_connections
        list _available_connections
    cdef dict connection_kwargs
    cdef connection_class
    cdef int _created_connections
    cdef set _in_use_connections


cdef class BlockingConnectionPool(object):
    cdef short int pid
    cdef int max_connections
    cdef dict connection_kwargs
    cdef connection_class, queue_class, timeout, pool, _connections
