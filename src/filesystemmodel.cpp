#include "filesystemmodel.h"

FileSystemModel::FileSystemModel(QDeclarativeItem *parent) :
    QSortFilterProxyModel(parent), m_model(new QDeclarativeFolderListModel(this))
{
    connect(m_model, SIGNAL(folderChanged()), this, SIGNAL(folderChanged()));
    connect(m_model, SIGNAL(countChanged()), this, SIGNAL(countChanged()));
    setSourceModel(m_model);
    setFilterRole(QDeclarativeFolderListModel::FileNameRole);
    setDynamicSortFilter(true);
}

void FileSystemModel::setQuery(const QString &query) {
    m_query = query;
    setFilterRegExp(QRegExp(query, Qt::CaseInsensitive, QRegExp::FixedString));
    emit queryChanged();
}
