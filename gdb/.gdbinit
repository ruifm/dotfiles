python
import sys
sys.path.insert(0, '/opt/adas/thirdparty/eigen/debug/gdb')
from printers import register_eigen_printers
register_eigen_printers (None)
end
