mod frame;
mod multiplex;
mod stream;
mod stream_result;
mod tls;

pub use frame::{read_frame, FrameCoder};
pub use multiplex::{AppStream, QuicCtrl, YamuxCtrl};
pub use stream::ProstStream;
pub use stream_result::StreamResult;
pub use tls::{TlsClientConnector, TlsServerAcceptor};

use crate::{CommandRequest, CommandResponse, KvError, Service, Storage};
use futures::{SinkExt, StreamExt};
use tokio::io::{AsyncRead, AsyncWrite};
use tracing::{info, warn};

pub struct ProstServerStream<S, Store> {}

#[cfg(test)]
pub mod utils {
    use anyhow::Result;
    use bytes::{BufMut, BytesMut};
    use std::{cmp::min, task::Poll};
    use tokio::io::{AsyncRead, AsyncWrite};

    #[derive(Default)]
    pub struct DummyStream {
        pub buf: BytesMut,
    }
}
