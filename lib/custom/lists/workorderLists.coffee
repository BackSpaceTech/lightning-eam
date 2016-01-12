# User editable lists
Lists.Workorders.Priority = {
  5: '5 - Emergency'
  4: '4 - Immediate'
  3: '3 - High Priority'
  2: '2 - Medium Priority'
  1: '1 - Low Priority'
  0: '0 - No Priority'
}
Lists.Workorders.Fault = {
  'vib': {
    'label':'Vibration'
    'cause': {
      'align': 'Alignment'
      'lube': 'Lubrication'
      'mount': 'Mounting'
      'loose': 'Loose Fit'
      'balance': 'Balancing'
      'nl': 'Not Listed'
    }
    'remedy': {
      'ohaul': 'Overhaul'
      'replace': 'Replace'
      'remount': 'Re-mount'
      'refit': 'Re-fit'
      'nl': 'Not Listed'
    }
  }
  'lube': {
    'label':'Lubrication'
    'cause': {
      'leak': 'Lubrication Leak'
      'water': 'Water Ingress'
      'seal': 'Seal Performance'
      'loose': 'Loose Fit'
      'dirt': 'Contamination / Dirt'
      'wrong': 'Wrong Lubricant'
      'nl': 'Not Listed'
    }
    'remedy': {
      'ohaul': 'Overhaul'
      'replace': 'Replace'
      'remount': 'Re-mount'
      'refit': 'Re-fit'
      'lube': 'Lubricant Change'
      'clean': 'Clean and Lube'
      'nl': 'Not Listed'
    }
  }
  'leak': {
    'label': 'Leaking'
    'cause': {
      'seal': 'Seal Failure'
      'gasket': 'Gasket Failure'
      'perf': 'Seal Performance'
      'loose': 'Loose Fit'
      'nl': 'Not Listed'
    }
    'remedy': {
      'ohaul': 'Overhaul'
      'replace': 'Replace'
      'remount': 'Re-mount'
      'refit': 'Re-fit'
      'lube': 'Lubricant Change'
      'clean': 'Clean and Lube'
      'nl': 'Not Listed'
    }
  }
  'perf': {
    'label': 'Performance Degradation'
    'cause': {
      'oper': 'Incorrect Operation'
      'wear': 'Wear'
      'nl': 'Not Listed'
    }
    'remedy': {
      'ohaul': 'Overhaul'
      'replace': 'Replace'
      'remount': 'Re-mount'
      'refit': 'Re-fit'
      'lube': 'Lubricant Change'
      'clean': 'Clean and Lube'
      'nl': 'Not Listed'
    }
  }
  'heat': {
    'label': 'Excessive Heat'
    'cause': {
      'vent': 'Poor Ventilation'
      'filt': 'Blocked Filter'
      'leak': 'Lubrication Leak'
      'water': 'Water Ingress'
      'loose': 'Loose Fit'
      'dirt': 'Contamination / Dirt'
      'wrong': 'Wrong Lubricant'
      'nl': 'Not Listed'
    }
    'remedy': {
      'clean': 'Clean Filter'
      'ohaul': 'Overhaul'
      'replace': 'Replace'
      'remount': 'Re-mount'
      'refit': 'Re-fit'
      'lube': 'Lubricant Change'
      'clean': 'Clean and Lube'
      'nl': 'Not Listed'
    }
  }
  'nop': {
    'label': 'Not Operating'
    'cause': {
      'oper': 'Incorrect Operation'
      'wear': 'Wear'
      'nl': 'Not Listed'
    }
    'remedy': {
      'ohaul': 'Overhaul'
      'replace': 'Replace'
      'remount': 'Re-mount'
      'refit': 'Re-fit'
      'lube': 'Lubricant Change'
      'clean': 'Clean and Lube'
      'nl': 'Not Listed'
    }
  }
  'noise': {
    'label': 'Excessive Noise'
    'cause': {
      'sound': 'Soundproofing'
      'align': 'Alignment'
      'lube': 'Lubrication'
      'mount': 'Mounting'
      'loose': 'Loose Fit'
      'balance': 'Balancing'
      'nl': 'Not Listed'
    }
    'remedy': {
      'ohaul': 'Overhaul'
      'replace': 'Replace'
      'remount': 'Re-mount'
      'refit': 'Re-fit'
      'nl': 'Not Listed'
    }
  }
  'nl': {
    'label': 'Not Listed'
    'cause': {
      'nl': 'Not Listed'
    }
    'remedy': {
      'nl': 'Not Listed'
    }
  }
  'nf': {
    'label': 'No Fault'
    'cause': {
      'nf': 'No Fault'
    }
    'remedy': {
      'nl': 'No Fault'
    }
  }
}
