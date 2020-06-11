import tickedoff from 'tickedoff';
import { Container } from 'unstated';

function _asyncToGenerator(fn) { return function () { var gen = fn.apply(this, arguments); return new Promise(function (resolve, reject) { function step(key, arg) { try { var info = gen[key](arg); var value = info.value; } catch (error) { reject(error); return; } if (info.done) { resolve(value); } else { return Promise.resolve(value).then(function (value) { step("next", value); }, function (err) { step("throw", err); }); } } return step("next"); }); }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError("Cannot call a class as a function"); } }

function _possibleConstructorReturn(self, call) { if (!self) { throw new ReferenceError("this hasn't been initialised - super() hasn't been called"); } return call && (typeof call === "object" || typeof call === "function") ? call : self; }

function _inherits(subClass, superClass) { if (typeof superClass !== "function" && superClass !== null) { throw new TypeError("Super expression must either be null or a function, not " + typeof superClass); } subClass.prototype = Object.create(superClass && superClass.prototype, { constructor: { value: subClass, enumerable: false, writable: true, configurable: true } }); if (superClass) Object.setPrototypeOf ? Object.setPrototypeOf(subClass, superClass) : subClass.__proto__ = superClass; }

var PersistContainer = function (_Container) {
  _inherits(PersistContainer, _Container);

  function PersistContainer() {
    var _this2 = this;

    _classCallCheck(this, PersistContainer);

    var _this = _possibleConstructorReturn(this, _Container.call(this));

    var rehydrate = function () {
      var _ref = _asyncToGenerator( /*#__PURE__*/regeneratorRuntime.mark(function _callee() {
        var config, persistStatePartial, serialState, incomingState;
        return regeneratorRuntime.wrap(function _callee$(_context) {
          while (1) {
            switch (_context.prev = _context.next) {
              case 0:
                config = _this.persist;
                persistStatePartial = { _persist_version: config.version };
                _context.prev = 2;
                _context.next = 5;
                return config.storage.getItem(config.key);

              case 5:
                serialState = _context.sent;

                if (!(serialState !== null)) {
                  _context.next = 18;
                  break;
                }

                incomingState = JSON.parse(serialState);
                // @NOTE no migrations yet, just clear state. Can be added later with similar api to redux-persist.

                if (!(incomingState._persist_version !== config.version)) {
                  _context.next = 14;
                  break;
                }

                if (process.env.NODE_ENV !== 'production') console.log('unstated-persist: state version mismatch, skipping rehydration');
                _context.next = 12;
                return _this.setState(persistStatePartial);

              case 12:
                _context.next = 16;
                break;

              case 14:
                _context.next = 16;
                return _this.setState(incomingState);

              case 16:
                _context.next = 20;
                break;

              case 18:
                _context.next = 20;
                return _this.setState(persistStatePartial);

              case 20:
                _context.next = 27;
                break;

              case 22:
                _context.prev = 22;
                _context.t0 = _context['catch'](2);
                _context.next = 26;
                return _this.setState(persistStatePartial);

              case 26:
                if (process.env.NODE_ENV !== 'production') console.log("err during rehydate", _context.t0);

              case 27:
                _context.prev = 27;

                // dont start persisting until rehydration is complete
                _this.subscribe(function () {
                  config.storage.setItem(config.key, JSON.stringify(_this.state)).catch(function (err) {
                    if (process.env.NODE_ENV !== 'production') console.log("unstated-persist: err during store", err);
                  });
                });
                return _context.finish(27);

              case 30:
              case 'end':
                return _context.stop();
            }
          }
        }, _callee, _this2, [[2, 22, 27, 30]]);
      }));

      return function rehydrate() {
        return _ref.apply(this, arguments);
      };
    }();

    tickedoff(rehydrate);
    return _this;
  }

  return PersistContainer;
}(Container);

var isBootstrapped = function isBootstrapped(container) {
  return container.state._persist_version !== undefined;
};

export { PersistContainer, isBootstrapped };
