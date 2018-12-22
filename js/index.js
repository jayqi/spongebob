function tOspoNgeBOB(str) {
  return str.toLowerCase().split('').map(c => ((Math.random() > 0.5) ? c.toUpperCase() : c)).join('');
}

module.exports = tOspoNgeBOB;
